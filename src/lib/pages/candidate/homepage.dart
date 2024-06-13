import 'package:flutter/material.dart';
import 'package:src/preferences.dart';
import 'settingspage.dart';
import 'chatpage.dart';
import 'profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appLanguage = appPreferences.appLanguage;
  String macAddress = "";
  String firstName = "";
  String lastName = "";
  String birthDate = "";
  String birthCity = "";
  String residenceCity = "";
  String email = "";
  String password = "";
  String softSkills = "";
  String jobExpectation = "";
  String currentJob = "";

  Map<String, String> adoptCandidate = {
    "fr_FR": "Adopte un Candidat",
    "en_US": "Adopt a Candidate",
  };
  Map<String, String> settings = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  Map<String, String> profile = {
    "fr_FR": "Profil",
    "en_US": "Profile",
  };

  List<String> cards = [
    "Card 1",
    "Card 2",
    "Card 3",
    "Card 4",
    "Card 5",
    "Card 6",
    "Card 7",
    "Card 8",
    "Card 9",
    "Card 10"
  ];

  Offset _startDragOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _opacity = 1.0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    print(
        "Mac Address: ${appPreferences.macAddress}\nFN: ${appPreferences.firstName}\nLN: ${appPreferences.lastName}\nBD: ${appPreferences.birthDate}");
    print(
        "BC: ${appPreferences.birthCity}\nRC: ${appPreferences.residenceCity}\nE: ${appPreferences.email}\nP: ${appPreferences.password}\nSS: ${appPreferences.softSkills}");
    print(
        "JE: ${appPreferences.jobExpectation}\nCJ: ${appPreferences.currentJob}");
  }

  void _onPanStart(DragStartDetails details) {
    _startDragOffset = details.localPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _currentOffset = details.localPosition - _startDragOffset;
      if (_isSelected() || _isRejected()) {
        _opacity = 0.5;
      } else {
        _opacity = 1.0;
      }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      if (_isSelected()) {
        debugPrint("Swiped to the right");
        cards.removeAt(0);
      } else if (_isRejected()) {
        debugPrint("Swiped to the left");
        cards.removeAt(0);
      }
      _currentOffset = Offset.zero;
      _opacity = 1.0;
    });
  }

  bool _isSelected() {
    return _currentOffset.dx != 0 && _currentOffset.dx > 150;
  }

  bool _isRejected() {
    return _currentOffset.dx != 0 && _currentOffset.dx < -150;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildSwipePage() {
    return Center(
      child: cards.isNotEmpty
          ? AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _opacity,
              child: Transform.translate(
                offset: _currentOffset,
                child: GestureDetector(
                  onPanStart: _onPanStart,
                  onPanUpdate: _onPanUpdate,
                  onPanEnd: _onPanEnd,
                  child: Container(
                    width: 300,
                    height: 500,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF303030), Color(0xFF000000)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Soft Skills',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            softSkills,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Text('No more cards', style: TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _buildSwipePage(),
      SettingsPage(settings, appLanguage),
      const ChatPage(),
      ProfilePage(profile, appLanguage),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Center(
                child: Text(
                  "${adoptCandidate[appLanguage]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: pages[_selectedIndex],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF424242), Color(0xFF000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: const Icon(Icons.chat, color: Colors.white),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}

