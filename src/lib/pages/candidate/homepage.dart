import 'package:flutter/material.dart';
import 'package:src/preferences.dart';

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

class SettingsPage extends StatelessWidget {
  Map<String, String> settings = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  String appLanguage;
  SettingsPage(this.settings, this.appLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${settings[appLanguage]}",
            style: const TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF424242), Color(0xFF000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chat', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF424242), Color(0xFF000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
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
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
            const SizedBox(width: 10),
            Text(widget.name),
          ],
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

class ProfilePage extends StatelessWidget {
  Map<String, String> profile = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  String appLanguage;
  ProfilePage(this.profile, this.appLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${profile[appLanguage]}',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF424242), Color(0xFF000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
