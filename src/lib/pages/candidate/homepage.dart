import 'package:flutter/material.dart';
import 'package:src/preferences.dart';
import 'settingspage.dart';
import 'chatpage.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  int _selectedIndex;
  HomePage(this._selectedIndex, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appLanguage = appPreferences.appLanguage;
  Offset _startDragOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _opacity = 1.0;

  static Map<String, dynamic> generateCardData() {
    final Random random = Random();
    final List<String> softSkills = [
      'Teamwork',
      'Problem-solving',
      'Adaptability',
      'Creativity',
      'Leadership',
      'Time management',
      'Communication',
      'Critical thinking',
      'Interpersonal skills',
      'Attention to detail',
      'Organization',
      'Decision-making',
      'Negotiation',
      'Conflict resolution',
      'Customer service',
      'Emotional intelligence',
      'Flexibility',
      'Innovation',
      'Motivation',
      'Patience',
      'Persuasion',
      'Planning',
      'Resilience',
      'Stress management',
      'Tolerance',
      'Trustworthiness',
      'Work ethic',
      'Analytical skills',
      'Collaboration'
    ];
    final List<String> workingFields = [
      'Sales',
      'Engineering',
      'Marketing',
      'Finance',
      'Healthcare',
      'Education',
      'Human Resources',
      'Information Technology',
      'Customer Service',
      'Operations',
      'Accounting',
      'Legal',
      'Manufacturing',
      'Retail',
      'Research',
      'Logistics',
      'Quality Assurance',
      'Purchasing',
      'Public Relations',
      'Media',
      'Design',
      'Business Development',
      'Consulting',
      'Product Management',
      'Project Management',
      'Real Estate',
      'Supply Chain',
      'Training',
      'Telecommunications',
      'Security',
      'Social Services',
      'Science',
      'Recruiting',
      'Pharmaceutical',
      'Nonprofit',
      'Military',
      'Management',
      'Insurance',
      'Hospitality',
      'Government',
      'General Business',
      'Facilities',
      'Environmental'
    ];
    final List<String> departments = [
      'Paris',
      'Lyon',
      'Marseille',
      'Bordeaux',
      'Lille',
      'Nice',
      'Toulouse',
      'Nantes',
      'Strasbourg',
      'Montpellier',
      'Rennes',
      'Grenoble',
      'Reims',
      'Le Havre',
      'Saint-Étienne',
      'Toulon',
      'Angers',
      'Dijon',
      'Brest',
      'Nîmes',
      'Perpignan',
      'Clermont-Ferrand',
      'Orléans',
      'Tours',
      'Limoges',
      'Annecy',
      'Boulogne-Billancourt',
      'Avignon',
      'Vitry-sur-Seine',
      'Créteil',
      'Poitiers',
      'Pau',
      'La Rochelle',
      'Calais',
      'Saint-Maur-des-Fossés',
      'Chambéry',
      'Niort',
      'Vannes',
      'Sarcelles',
      'Laval',
      'Meaux',
      'Cholet',
      'Brive-la-Gaillarde',
      'Arles',
      'Montélimar',
      'Agen',
      'Saint-Brieuc'
    ];

    softSkills.shuffle(random);
    return {
      'softSkills': softSkills.take(3).toList(),
      'workingField': workingFields[random.nextInt(workingFields.length)],
      'department': departments[random.nextInt(departments.length)],
    };
  }

  final List<Map<String, dynamic>> cards = List.generate(50, (index) {
    return generateCardData();
  });

  Map<String, String> adoptCandidate = {
    "fr_FR": "Adopte un Candidat",
    "en_US": "Adopt a Candidate",
  };
  Map<String, String> settings = {
    "fr_FR": "Paramètres",
    "en_US": "Settings",
  };
  Map<String, String> chat = {
    "fr_FR": "Discussions",
    "en_US": "Chat",
  };
  Map<String, String> profile = {
    "fr_FR": "Profil",
    "en_US": "Profile",
  };

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

  void _swipeCard(Offset direction) {
    setState(() {
      _currentOffset = direction;
      if (_isSelected() || _isRejected()) {
        _addCardBackToList();
      }
      _currentOffset = Offset.zero;
      _opacity = 1.0;
    });
  }

  void _addCardBackToList() {
    if (cards.isNotEmpty) {
      setState(() {
        Map<String, dynamic> removedCard = cards.removeAt(0);
        cards.add(removedCard);
      });
    }
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
      if (_isSelected() || _isRejected()) {
        _addCardBackToList();
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
      widget._selectedIndex = index;
    });
  }

  String _getAppBarTitle() {
    switch (widget._selectedIndex) {
      case 1:
        return settings[appLanguage]!;
      case 2:
        return chat[appLanguage]!;
      default:
        return adoptCandidate[appLanguage]!;
    }
  }

  Widget _buildSwipePage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 80.0), // Padding between stack and FAB
        child: SizedBox(
          height: 600, // Ensure this matches your card height
          width: 350, // Adjust as needed to ensure cards are centered
          child: Stack(
            alignment: Alignment.center,
            children: cards.take(1).map((card) {
              return Positioned.fill(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _opacity,
                  child: Transform.translate(
                    offset: _currentOffset,
                    child: GestureDetector(
                      onPanStart: _onPanStart,
                      onPanUpdate: _onPanUpdate,
                      onPanEnd: (details) {
                        if (_isSelected() || _isRejected()) {
                          _swipeCard(_currentOffset);
                        } else {
                          setState(() {
                            _currentOffset = Offset.zero;
                            _opacity = 1.0;
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        height: 600, // Ensure this matches your card height
                        width: 350, // Ensure this matches your card width
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 117, 255, 100),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Soft Skills',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              for (var skill in card['softSkills'])
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    skill,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 30),
                              const Text(
                                'Working Field',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                card['workingField'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                card['department'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.clear,
                                          color:
                                              Color.fromARGB(255, 193, 43, 32),
                                          size: 30),
                                      onPressed: () =>
                                          _swipeCard(const Offset(-500, 0)),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.check,
                                          color:
                                              Color.fromARGB(255, 25, 148, 29),
                                          size: 30),
                                      onPressed: () =>
                                          _swipeCard(const Offset(500, 0)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _buildSwipePage(),
      SettingsPage(settings, appLanguage),
      const ChatPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            AppBar(
              title: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/icon.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _getAppBarTitle(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: const Color.fromRGBO(0, 117, 255, 100),
              elevation: 0,
            ),
            Expanded(
              child: pages[widget._selectedIndex],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 117, 255, 100),
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
              icon: const Icon(Icons.chat, color: Colors.white),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}
