import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<String> messagesList0 = [
  'Hello, how are you?',
  'I\'m good, thanks! How about you?',
];

List<Widget> messages0 = List.generate(
  messagesList0.length,
  (index) => ChatBubble(
    text: messagesList0[index],
    isCurrentUser: index % 2 == 0,
    index: index,
  ),
);

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ChatListItem(
            name: 'John Doe',
            lastMessage: messagesList0.isEmpty
                ? "- Send a message to John Doe!"
                : messagesList0.last,
            onTap: () {
              context.go("/chatscreen");
            },
          ),
          ChatListItem(
            name: 'Jane Smith',
            lastMessage: 'Sure, I can help with that.',
            onTap: () {},
          ),
          ChatListItem(
            name: 'Alice Johnson',
            lastMessage: 'Let\'s catch up this weekend.',
            onTap: () {},
          ),
          ChatListItem(
            name: 'Bob Joon',
            lastMessage: 'I have a question about the project.',
            onTap: () {},
          ),
          ChatListItem(
            name: 'Emily Davis',
            lastMessage: 'Can you send me the last report?',
            onTap: () {},
          ),
          ChatListItem(
            name: 'Michael Brown',
            lastMessage: 'I need to reschedule our meeting.',
            onTap: () {},
          ),
          ChatListItem(
            name: 'Sarah Wilson',
            lastMessage: 'I have some feedback for you.',
            onTap: () {},
          ),
          ChatListItem(
            name: 'Davis Lee',
            lastMessage: 'I have a question about this task.',
            onTap: () {},
          ),
          ChatListItem(
            name: 'James Robinson',
            lastMessage: 'I need to discuss the timeline.',
            onTap: () {},
          ),
          ChatListItem(
            name: 'Ava Hernandez',
            lastMessage: 'I have a question about the deliverables.',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  String lastMessage;
  final VoidCallback onTap;

  ChatListItem({
    required this.name,
    required this.lastMessage,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text(lastMessage),
      onTap: onTap,
    );
  }
}

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messagesList0.add(_controller.text);
        messages0.add(
          ChatBubble(
            text: messagesList0.last,
            isCurrentUser: true,
            index: messagesList0.length - 1,
          ),
        );
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go("/homepage2");
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...messages0,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onSubmitted: (value) {
                      _sendMessage();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatefulWidget {
  String text;
  bool isCurrentUser;
  int index;

  ChatBubble({
    required this.text,
    required this.isCurrentUser,
    required this.index,
    super.key,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  void _deleteMessage(int index) {
    setState(() {
      messagesList0.removeAt(index);
      messages0.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment:
          widget.isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            showDialog(
              context: context,
              barrierColor: Colors.black.withOpacity(0.8),
              builder: (BuildContext context) => StatefulBuilder(
                builder: (context, setState) => LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                        Dialog(
                          insetPadding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.15,
                              vertical: size.height * 0.10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    top: size.width * 0.05,
                                    bottom: size.height * 0.01),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Delete the message?",
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        debugPrint("Deleted");
                                        _deleteMessage(widget.index);
                                        context.pushReplacement("/chatscreen");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          });
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.isCurrentUser ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
