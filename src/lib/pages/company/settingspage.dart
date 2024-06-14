import 'package:flutter/material.dart';
import 'package:src/pages/company/chatpage.dart';

List<String> companyInfo = [
  "McDonalds", // name
  "Vierzon", // city
  "mcdo-vierzon@contact.com", // email
  "azerty", // password
];

class Settings extends StatefulWidget {
  final Size size;
  final String appLanguage;
  const Settings(this.size, this.appLanguage, {Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(widget.size.width * 0.04),
      child: Container(
        padding: EdgeInsets.all(widget.size.width * 0.0045),
        height: widget.size.height * 0.7,
        width: widget.size.width * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileTabs(size, selectedIndex, (index) {
                setState(() {
                  selectedIndex = index;
                });
              }),
              selectedIndex == 0
                  ? profileTabBox(size, selectedIndex, "About")
                  : selectedIndex == 1
                      ? profileTabBox(size, selectedIndex, "Job offers")
                      : selectedIndex == 2
                          ? profileTabBox(size, selectedIndex, "Preferences")
                          : profileTabBox(size, selectedIndex, "Language"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget aboutTab(var size) {
  return Padding(
    padding: EdgeInsets.only(top: size.width * 0.0085),
    child: Container(
      height: size.width * 0.125,
      width: size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  companyInfo[0] + "  -  " + companyInfo[1],
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Email: " + companyInfo[2],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class ProfileTabs extends StatefulWidget {
  final Size size;
  final int selectedIndex;
  final Function(int) onTabSelected;
  const ProfileTabs(this.size, this.selectedIndex, this.onTabSelected,
      {Key? key})
      : super(key: key);

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.onTabSelected(0);
          },
          child: aboutTab(widget.size),
        ),
        GestureDetector(
          onTap: () {
            widget.onTabSelected(1);
          },
          child: oneProfileTab(
              widget.size, "Job offers", "Offers, Soft skills, ...", 0.25),
        ),
        GestureDetector(
          onTap: () {
            widget.onTabSelected(2);
          },
          child: oneProfileTab(
              widget.size, "Preferences", "Theme, Notifications, ...", 0.25),
        ),
        GestureDetector(
          onTap: () {
            widget.onTabSelected(3);
          },
          child: oneProfileTab(
              widget.size, "Language", "Change language, ...", 0.25),
        ),
        logoutButton(widget.size),
      ],
    );
  }
}

Widget oneProfileTab(
    var size, String tabName, String description, double multiplier) {
  return Container(
    height: size.width * 0.04,
    width: size.width * multiplier,
    decoration: BoxDecoration(
      color: Colors.grey[300],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                tabName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget logoutButton(var size) {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Container(
      height: size.height * 0.05,
      width: size.width * 0.05,
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: const Center(
        child: Text(
          "Log out",
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
  );
}

class profileTabBox extends StatefulWidget {
  final Size size;
  int selectedIndex;
  String title;
  profileTabBox(this.size, this.selectedIndex, this.title, {super.key});

  @override
  State<profileTabBox> createState() => _profileTabBoxState();
}

class _profileTabBoxState extends State<profileTabBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.65,
      width: widget.size.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          AppBar(
            title: Text(widget.title),
          ),
          selectedIndex == 0 ? aboutList(widget.size) : offersList(widget.size),
        ],
      ),
    );
  }
}

Widget aboutList(var size) {
  return Column(
    children: [
      oneProfileTab(size, "Company Name", companyInfo[0], 0.5),
      oneProfileTab(size, "Company City", companyInfo[1], 0.5)
    ],
  );
}

Widget offersList(var size) {
  return Column(
    children: [
      oneProfileTab(size, "Offers", "Software Engineer", 0.5),
      oneProfileTab(
          size, "Soft skills", "Team-work, problem-solving, ...", 0.5),
    ],
  );
}
