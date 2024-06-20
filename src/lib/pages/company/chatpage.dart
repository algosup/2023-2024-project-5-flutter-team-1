import 'package:flutter/material.dart';
import 'package:src/preferences.dart';

// the messages' list of the 1st DM
List<Widget> messages0 = [
  message(
    "Good morning!",
    false,
  ),
  message(
    "I'd like to know more about the job",
    false,
  ),
];
// the messages' list of the 2nd DM
List<Widget> messages1 = [
  message(
    "Hello, it looks like I'm the chosen one!",
    false,
  ),
  message(
    "",
    false,
  ),
];
// the messages' list of the 3rd DM
List<Widget> messages2 = [
  message(
    "I'm glad to be the perfect profile for you.",
    false,
  ),
  message(
    "",
    false,
  ),
];
// the messages' list of the 4rd DM
List<Widget> messages3 = [
  message(
    "",
    false,
  ),
  message(
    "",
    false,
  ),
];
// the messages' list of the 5rd DM
List<Widget> messages4 = [
  message(
    "",
    false,
  ),
  message(
    "",
    false,
  ),
];
// the messages' list of the 6rd DM
List<Widget> messages5 = [
  message(
    "",
    false,
  ),
  message(
    "",
    false,
  ),
];

// the index of the selected chat
int selectedIndex = -1;

// ignore: must_be_immutable
class ChatManager extends StatefulWidget {
  var size;
  String appLanguage;
  ChatManager(this.size, this.appLanguage, {super.key});

  @override
  State<ChatManager> createState() => _ChatManagerState();
}

class _ChatManagerState extends State<ChatManager> {
  // the function that returns the selected chat

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.size.width * 0.075),
      child: Container(
        padding: EdgeInsets.all(widget.size.width * 0.0045),
        height: widget.size.height * 0.6,
        width: widget.size.width * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: chats(
                          widget.size,
                          "John Doe",
                          "Software Engineer",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: chats(
                          widget.size,
                          "Jeremy",
                          "Software Engineer",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        child: chats(
                          widget.size,
                          "Elone",
                          "Software Engineer",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 3;
                          });
                        },
                        child: chats(
                          widget.size,
                          "Julian",
                          "Software Engineer",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 4;
                          });
                        },
                        child: chats(
                          widget.size,
                          "Joe",
                          "Software Engineer",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // depending on the selectedIndex of the chat, we display different chatboxes
              selectedIndex == 0
                  ? chatBox(widget.size, "John Doe", "Engineer", messages0)
                  : selectedIndex == 1
                      ? chatBox(widget.size, "John Dane", "Cleaner", messages1)
                      : selectedIndex == 2
                          ? chatBox(widget.size, "Elone", "YouTuber", messages2)
                          : selectedIndex == 3
                              ? chatBox(widget.size, "Julian",
                                  "Generalist Doctor", messages3)
                              : selectedIndex == 4
                                  ? chatBox(widget.size, "John Daner",
                                      "Mechanics", messages4)
                                  : selectedIndex == 5
                                      ? chatBox(widget.size, "John Dee",
                                          "Eye Doctor", messages5)
                                      : chatBoxEmpty(widget.size),
            ],
          ),
        ),
      ),
    );
  }
}

// the widget that displays the selectable chats on the left
Widget chats(var size, String name, String job) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: size.height * 0.1,
      width: size.width * 0.3,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "$name - $job",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/* 
  the widget that displays the chatbox according to the chosen chat 
  contains: a bar at the top displaying the chosen chat, the scrollable messages, the textfield to type a message 
*/
class chatBox extends StatefulWidget {
  var size;
  String name;
  String job;
  List<Widget> messages = [];
  chatBox(this.size, this.name, this.job, this.messages, {super.key});

  @override
  State<chatBox> createState() => _chatBoxState();
}

class _chatBoxState extends State<chatBox> {
  TextEditingController controller = TextEditingController();
  String messageSent = "";

  List<Widget> allMessages() {
    return widget.messages;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: widget.size.height * 0.6,
        width: widget.size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: widget.size.height * 0.07,
              width: widget.size.width * 0.46,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: Text(
                  "${widget.name}  -  ${widget.job}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: widget.messages.last ==
                        widget.messages[widget.messages.length - 2]
                    ? Container()
                    : Column(
                        children: [
                          ...widget.messages,
                        ],
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.add,
                  ),
                  Container(
                    width: widget.size.width * 0.35,
                    height: widget.size.height * 0.07,
                    child: TextField(
                      obscureText: false,
                      controller: controller,
                      onSubmitted: (value) {
                        setState(() {
                          if (value != "") {
                            messageSent = value;
                            widget.messages.add(
                              message(
                                messageSent,
                                true,
                              ),
                            );
                            controller.clear();
                            debugPrint("Sent:");
                          } else {
                            messageSent = value;
                          }
                          debugPrint(messageSent);
                        });
                      },
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: "Message ${widget.name}",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(120, 120, 120, 100),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// widget that returns the message and the time it has been sent
Widget message(String mess, bool fromUser) {
  DateTime now = DateTime.now();
  return mess == ""
      ? Container()
      : Column(
          children: [
            Row(
              mainAxisAlignment:
                  fromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: fromUser
                      ? const EdgeInsets.only(right: 20)
                      : const EdgeInsets.only(left: 20),
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          width:
                              mess.length >= 30 ? 450 : (mess.length + 5) * 15,
                          decoration: BoxDecoration(
                            color: fromUser
                                ? Colors.blueGrey[300]
                                : Colors.grey[400],
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                mess,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                                maxLines: null,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  fromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: fromUser
                      ? const EdgeInsets.only(right: 30)
                      : const EdgeInsets.only(left: 30),
                  child: now.minute < 10
                      ? Text(
                          "${now.hour}:0${now.minute}",
                        )
                      : Text("${now.hour}:${now.minute}"),
                ),
              ],
            ),
          ],
        );
}

// widget that is called when no chat is selected -> returns a specific chatbox
Widget chatBoxEmpty(var size) {
  Map<String, String> chooseMessage = {
    "fr_FR": "Choisissez un message.",
    "en_US": "Choose a message.",
  };
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      height: size.height * 0.6,
      width: size.width * 0.45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          "${chooseMessage[appPreferences.appLanguage]}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
    ),
  );
}
