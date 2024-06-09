// File made by DELILLE Elone - https://github.com/HiNett
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:src/preferences.dart';

class DocumentStorage {
  Future<String> get folderLocalization async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get fileLocalization async {
    final path = await folderLocalization;
    return File("$path/myFile.txt");
  }

  Future<bool> isFileEmpty() async {
    try {
      final file = await fileLocalization;
      String content = await file.readAsString();
      return content.isEmpty;
    } catch (e) {
      print("Error, file is empty: $e");
      return true;
    }
  }

  Future<bool> checkMacAddress() async {
    try {
      final file = await fileLocalization;
      String content = await file.readAsString();
      print("Checking MAC address: $content");
      final response = await macDatabase(content);
      print("URL Sended");
      if (response.statusCode == 200) {
        print("Entering the if");
        String body = response.body;
        print("Fetching: $body");
        if (body == "[false]") {
          return false;
        } else if (body == "[true]") {
          return true;
        }
      } else {
        print("Error: HTTP status ${response.statusCode}");
      }
    } catch (e) {
      print("Error on checking mac address on database: $e");
    }
    return false;
  }

  Future<http.Response> macDatabase(String content) {
    var encodedContent = Uri.encodeComponent(content);
    return http.get(Uri.parse(
        "https://ffeur.pq.lu/v1/data/getApi/doesMacAddressExist.php?mac=$encodedContent"));
  }

  Future<bool> createOnDatabase() async {
    try {
      print("We enter on the try");
      final file = await fileLocalization;
      print("We found the $file");
      String content = await file.readAsString();
      print("We have the $content");
      bool? yes = await createMacDatabase(content);
      return true;
    } catch (e) {
      print("Failed to create on database: $e");
      return false;
    }
  }

  Future<bool> createMacDatabase(String content) async {
    try {
      print("We entered the second try");
      var response = await http.post(
        Uri.parse("https://ffeur.pq.lu/v1/data/getApi/macAddress.php"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"mac": content}),
      );
      print("We did manage to send the POST");
      var ok = response.statusCode;
      print("Status code received: $ok");
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("Response from server: $body");
        return body['success'] ?? false;
      }
      return false;
    } catch (e) {
      print("HTTP request failed: $e");
      return false;
    }
  }

  Future<String> userLanguageFetch(String address) async {
    final response = await getUserLanguage(address);
    if (response.statusCode == 200) {
      String body = response.body;
      print("Response Body: ${response.body}");
      return body;
    } else {
      return "Error Status Code : ${response.statusCode}";
    }
  }

  Future<http.Response> getUserLanguage(String address) {
    var encode = Uri.encodeComponent(address);
    return http.get(Uri.parse(
        "https://ffeur.pq.lu/v1/data/getApi/getUserLanguage.php?mac=$encode"));
  }
}

class RedirectionPage extends StatefulWidget {
  const RedirectionPage({super.key, required this.storage});

  final DocumentStorage storage;

  @override
  State<RedirectionPage> createState() => _RedirectionPageState();
}

class _RedirectionPageState extends State<RedirectionPage> {
  String appMacAddress = "NULL";
  @override
  void initState() {
    super.initState();
    macAddress();
  }

  Future<void> macAddress() async {
    final file = await widget.storage.fileLocalization;
    bool fileExist = await file.exists();
    if (!fileExist) {
      try {
        await file.create(recursive: true);
      } catch (e) {
        print("Failed to create the file: $e");
      }
    }

    bool isFileEmpty = await widget.storage.isFileEmpty();
    if (isFileEmpty) {
      try {
        final random = Random();
        List<String> parts = List.generate(6,
            (index) => random.nextInt(256).toRadixString(16).padLeft(2, '0'));
        String address = parts.join(':');

        await file.writeAsString(address);
      } catch (e) {
        print("Impossible to generate the Mac Address: $e");
      }
    }

    bool doesMacAddressExistOnDatabase = await widget.storage.checkMacAddress();
    if (doesMacAddressExistOnDatabase == false) {
      print("We enter the false loop");
      await widget.storage.createOnDatabase();
    }

    appMacAddress = await file.readAsString();

    String userLang = await widget.storage.userLanguageFetch(appMacAddress);
    if (userLang == "[\"vfr_FR\"]" || userLang == "[\"ven_US\"]") {
      setState(() {
        if (userLang == "[\"vfr_FR\"]") {
          appPreferences.setLanguage("fr_FR");
          print(appPreferences.appLanguage);
        } else {
          appPreferences.setLanguage("en_US");
        }
        appPreferences.macAddress = appMacAddress;
        context.go("/loginpage");
      });
    } else {
      setState(() {
        appPreferences.macAddress = appMacAddress;
        context.go("/languagehomepage");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
