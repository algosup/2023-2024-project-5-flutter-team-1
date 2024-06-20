import 'package:flutter/material.dart';
import 'package:src/pages/candidate/homepage.dart';
import 'package:go_router/go_router.dart';

List<String> messagesList0 = [
  'Hello, how are you?',
  'I\'m good, thanks! How about you?',
];

List<Widget> messages0 = [
  ChatBubble(
    text: messagesList0[0],
    isCurrentUser: true,
  ),
  ChatBubble(
    text: messagesList0[1],
    isCurrentUser: false,
  ),
];

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

List<Widget> messages0 = [
  ChatBubble(
    text: messagesList0[0],
    isCurrentUser: true,
  ),
  ChatBubble(
    text: messagesList0[1],
    isCurrentUser: false,
  ),
];

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
            lastMessage: messagesList0.last,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    name: 'John Doe',
                    messages: messages0,
                  ),
                ),
              );
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

class ChatListItem extends StatefulWidget {
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
  State<ChatListItem> createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(Icons.person),
      ),
      title: Text(widget.name),
      subtitle: Text(widget.lastMessage),
      onTap: widget.onTap,
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String name;
  List<Widget> messages;

  ChatScreen({
    required this.name,
    required this.messages,
    super.key,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messagesList0.add(_controller.text);
        widget.messages.add(
          ChatBubble(
            text: messagesList0.last,
            isCurrentUser: true,
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
            setState(() {
              context.go("/homepage2");
            });
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
                  ...widget.messages,
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

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isCurrentUser;

  ChatBubble({
    required this.text,
    required this.isCurrentUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
