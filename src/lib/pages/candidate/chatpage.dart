import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ChatListItem(
            name: 'John Doe',
            lastMessage: 'I\'m good, thanks! How about you?',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'John Doe',
                    lastMessage: 'I\'m good, thanks! How about you?',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Jane Smith',
            lastMessage: 'Sure, I can help with that.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Jane Smith',
                    lastMessage: 'Sure, I can help with that.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Alice Johnson',
            lastMessage: 'Let\'s catch up this weekend.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Alice Johnson',
                    lastMessage: 'Let\'s catch up this weekend.',
                  ),
                ),
              );
            },
          ),
          // Add more chat list items as needed
          ChatListItem(
            name: 'Bob Johnson',
            lastMessage: 'I have a question about the project.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Bob Johnson',
                    lastMessage: 'I have a question about the project.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Emily Davis',
            lastMessage: 'Can you send me the latest report?',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Emily Davis',
                    lastMessage: 'Can you send me the latest report?',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Michael Brown',
            lastMessage: 'I need to reschedule our meeting.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Michael Brown',
                    lastMessage: 'I need to reschedule our meeting.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Sarah Wilson',
            lastMessage: 'I have some feedback for you.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Sarah Wilson',
                    lastMessage: 'I have some feedback for you.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'David Lee',
            lastMessage: 'I have a question about the task.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'David Lee',
                    lastMessage: 'I have a question about the task.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Olivia Taylor',
            lastMessage: 'I need to discuss the budget.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Olivia Taylor',
                    lastMessage: 'I need to discuss the budget.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Daniel Anderson',
            lastMessage: 'I have a suggestion for the project.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Daniel Anderson',
                    lastMessage: 'I have a suggestion for the project.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Sophia Martinez',
            lastMessage: 'I need to follow up on the proposal.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Sophia Martinez',
                    lastMessage: 'I need to follow up on the proposal.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'William Thompson',
            lastMessage: 'I have a question about the deadline.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'William Thompson',
                    lastMessage: 'I have a question about the deadline.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Emma Garcia',
            lastMessage: 'I have a question about the requirements.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Emma Garcia',
                    lastMessage: 'I have a question about the requirements.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'James Robinson',
            lastMessage: 'I need to discuss the timeline.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'James Robinson',
                    lastMessage: 'I need to discuss the timeline.',
                  ),
                ),
              );
            },
          ),
          ChatListItem(
            name: 'Ava Hernandez',
            lastMessage: 'I have a question about the deliverables.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Ava Hernandez',
                    lastMessage: 'I have a question about the deliverables.',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final VoidCallback onTap;

  const ChatListItem({
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
  final String name;
  final String lastMessage;

  const ChatScreen({
    required this.name,
    required this.lastMessage,
    super.key,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _showContainer = false;
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messages.add('Hello, how are you?'); // Initial message
    _messages.add(widget.lastMessage); // Last message from the list
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
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
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  text: _messages[index],
                  isCurrentUser:
                      index % 2 == 0, // For demo purposes, alternate the sender
                  onTap: () {
                    setState(() {
                      _showContainer = !_showContainer;
                    });
                  },
                );
              },
            ),
          ),
          if (_showContainer)
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                'This is a cool container that appears when you tap on a discussion!',
                style: TextStyle(fontSize: 18),
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
  final VoidCallback onTap;

  const ChatBubble({
    required this.text,
    required this.isCurrentUser,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }
}
