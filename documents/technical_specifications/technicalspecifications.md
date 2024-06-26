# Adopt a Candidate - Technical Specifications

<details>
<summary>Table of Contents

</summary>

- [Adopt a Candidate - Technical Specifications](#adopt-a-candidate---technical-specifications)
  - [Audience](#audience)
  - [Overview](#overview)
    - [Requirements](#requirements)
    - [Nice To Have](#nice-to-have)
    - [Priorities](#priorities)
  - [Conventions](#conventions)
    - [Naming](#naming)
    - [GitHub](#github)
      - [Organization](#organization)
    - [Coding](#coding)
      - [Comments](#comments)
      - [Formatting](#formatting)
      - [Folder Structure](#folder-structure)
  - [Technical Architecture](#technical-architecture)
    - [Technology Used](#technology-used)
      - [Supported Platforms](#supported-platforms)
      - [Real Device Use](#real-device-use)
        - [Android-based Phone](#android-based-phone)
        - [IOS-based Phone](#ios-based-phone)
        - [PC](#pc)
      - [Software](#software)
    - [Front-end](#front-end)
      - [SafeArea](#safearea)
      - [Images](#images)
      - [Sizes](#sizes)
      - [Text Font](#text-font)
      - [TextStyle Reusability](#textstyle-reusability)
      - [Swipe Cards](#swipe-cards)
    - [Back-end](#back-end)
      - [Routes](#routes)
      - [Maps](#maps)
      - [Database and Data Flow](#database-and-data-flow)
      - [Error handling](#error-handling)
  - [Security](#security)
  - [Glossary](#glossary)

</details>

## Audience

**This document is primarily intended for:**

- Software Engineers:
    to understand the user and technical requirements, and to guide their work. Help them understand challenges and choices made.

It's highly recommended to read the [Functional Specifications](../functional_specifications/functionalspecification.md) before going further in this document.

## Overview

Adopt A Candidate is a "Tinder style" recruitment application that matches companies with job-seekers in a different way.
We'll code it using Flutter, all the technical specificities are described [here](#technical-architecture).

### Requirements

- The application will need to be available on phone, and PC.
- **The phone format will be dedicated to the candidate's use:**
  - This format promotes the swipe system, the user just has to swipe and receive a message from a company when he matches with it.
- **The PC format will be dedicated to a company's use.**
  - This format promotes the chat managing system, the company just gets notified when it matches with a job-seeker and they can send the first message to the job-seeker, initiating the discussion.

### Nice To Have

- The phone and PC applications can be used either by a candidate or a company.
- Different themes (light/dark themes, etc).
- Some back-end using a database to store data.
- APIs concerning choices in the registration.

### Priorities

- The front-end of the application.
- The compatibility with different devices.

## Conventions

### Naming

The naming conventions are explained in the [dedicated file](../../conventionsandrules.md).

### GitHub

#### Organization

- Each pull-request has to contain labels, the project, the dedicated milestone, and at least 2 reviewers.
- Each issue has to contain labels, the project, the dedicated milestone, and the assigned member.
- The working version of the project goes into the *Release* branch.
- Release should be made from the main.
- The main branch should be updated at least once a day (when the team is on project-time).
- There can't be any direct push to the main. The member has to do a pull-request to merge their changes in the main.
- Only push code that has been tested (working code).

### Coding

#### Comments

The rule concerning comments is explained in the [conventions and rules file](../../conventionsandrules.md).

#### Formatting

- You can format automatically your .dart files using *Shift* + *Alt* + F.
- Avoid creating too long lines.
- Avoid non-ASCII characters.

Here's an example of the formatting rules:

```dart

/*
  Widget showing formatting
*/

Widget example(String word, int number){
    //write your piece of code here
}

```

#### Folder Structure

A folder structure promotes coherent and understandable file locations.

**Documents Files Structure**

The `documents` folder has to follow this structure:

```
documents/<br>
  ├── code_documentation/<br>
  │     ├── codedocumentation.md<br>
  │     ├── codedocumentation.pdf<br>
  ├── functional_specifications/<br>
  │     ├── functionalspecifications.md<br>
  ├── management/<br>
  │     ├── codeofconduct.md<br>
  │     ├── managementdocument.md<br>
  │     ├── projectcharter.md<br>
  │     ├── weeklyreports.md<br>
  ├── technical_specifications/<br>
  │     ├── technicalspecifications.md<br>
  ├── test_plan/<br>
  │     ├── testplan.md<br>
  ├── user_manual/<br>
  │     ├── usermanual.md<br>
  │     ├── usermanual.pdf<br>
  ├── conventionsandrules.md<br>
```

**Code Files Structure**

The `lib` folder has to follow this structure:

```
lib/<br>
  ├── pages/<br>
  │     ├── homepage.dart<br>
  |     ├── company/<br>
  │     |      ├── languagehomepage.dart<br>
  │     |      ├── loginpage.dart<br>
  │     |      ├── redirection.dart<br>
  │     |      ├── registerpage.dart<br>
  │     |      ├── registerpage2.dart<br>
  │     |      ├── registerpage3.dart<br>
  │     |      ├── settings.dart<br>
  │     |      ├── . . .<br>
  |     ├── candidate/<br>
  │     |      ├── homepage.dart<br>
  │     |      ├── languagehomepage.dart<br>
  │     |      ├── loginpage.dart<br>
  │     |      ├── redirection.dart<br>
  │     |      ├── registerpage.dart<br>
  │     |      ├── registerpage2.dart<br>
  │     |      ├── registerpage3.dart<br>
  │     |      ├── settings.dart<br>
  │     |      ├── . . .<br>
  ├── main.dart<br>
  ├── preferences.dart<br>
  ├── routes.dart<br>
```

The pages of the application will be in a dedicated folder `pages`, with `candidate` and `company` dedicated folders, due to pages' differences.

## Technical Architecture

### Technology Used

#### Supported Platforms

As of the current release, Flutter supports the following platforms as part of the Google-tested and best-effort platform tier:

|  Platform  |  Version   |  Channels  |
|   :----:   |   :------:   |   :--:   |
| Android | API 16 (Android 4.1) & above | All |
| IOS | IOS 11 & above | All |
| Linux | Debian, 64-bit | All |
| macOS | El Capitan (10.11) & above | All |
| Web | Chrome 84 & above | All |
| Web | Firefox 72.0 & above | All |
| Web | Safari on El Capitan & above | All |
| Web | Edge 1.2.0 & above | All |
| Windows | Windows 7 & above, 64-bit | All |

**All channels include master, beta, and stable channels.**

#### Real Device Use

Phones and PCs can be used to debug Flutter code, either on Android, IOS or PC. Some requirements need to be done though, and in a certain range of devices:

**Flutter needs to be setup correctly**

- Run `flutter doctor` in your terminal

It should display " No issues found! "

Windows:

![flutter-doctor-windows](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/ce6777ed-ccfd-4c6f-b049-d3bbae302309)

macOS:

![flutter-doctor-mac](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/97a09c69-2e59-4dce-a039-02040d0b272c)

If not, it will also display where the issues come from and how you can overcome them.

##### Android-based Phone

**The Android-based device needs to be setup correctly**

- Enable Developer mode

>Go to Settings > System in your device.<br>
Touch About phone.<br>
Touch the Build number field 7 times. You will begin seeing a message as you approach the 7 touches.<br>
Once you did the 7 touches, the message "You are now a developer" will appear.

You can now access the Developer's settings.

- Authorize USB Debug mode

>Search Debug in the Settings.<br>
Go to USB Debug.<br>
Enable USB Debug, regardless the warnings.

##### IOS-based Phone

**The IOS-based device needs to be setup correctly**

- Enable Developer mode

>Open Settings > Privacy & Security > Developer Mode.<br>
Enable the toggle.<br>
You will receive a prompt from iOS to restart your device.<br>
Restart the device.

Your device is now in Developer mode.

- Approve the application's developer

>Touch Settings > General > Profiles, or Profiles and Device Management.<br>
The profile corresponding to the developer is displayed in the "Enterprise App" section.<br>
Under the Enterprise App header, tap the profile name to approve the developer.<br>
Confirm your choice when prompted.

Once the profile has been approved, you can manually install other applications from this developer and open them immediately.

**Your IOS or Android-based device is now visible from your IDE, and you can run and debug your application on it by installing the debug APK built.**

It could be better to debug and test your code on a real portable device, though you can obviously do it on a virtual device.

##### PC

Running and debugging Flutter code on PC is quite easier than on phones.
You already have a device named by your OS:

![desktop-device](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/e2e8be53-6a52-4d89-8f2d-1d9126ab362c)

You can directly run and debug on it, no need to setup something else.

Also, you can use virtual devices on your PC, whether it is IOS or Android-based.
Some of these emulators are already integrated to Android-Studio and else, though you sometimes have to create them yourself.

#### Software

Here's the IDE that we'll use:

- Visual Studio Code | version 1.89.1 or newer (mainly used)
- Android Studio Jellyfish | 2023.3.1 or newer

We'll use Dart version 3.4.0 or newer and Flutter version 3.22.0 or newer (visible if you run `flutter doctor -v` in your terminal).

**Dependencies:**

- Flutter SDK.
  - already setup if there's no issue in the flutter doctor summary.
- Flutter widget package implementing material design.
  - importation: `import 'package:flutter/material.dart';`
- Flutter router package implementing pages navigation.
  - importation: `import 'package:go_router/go_router.dart';`
- Flutter IOS package implementing IOS design.
  - importation: `import 'package:flutter/cupertino.dart';`
- Flutter package making HTTP requests.
  - importation: `import 'package:http/http.dart' as http;`
- Dart library implementing mathematical constants and functions, plus a random number generator.
  - importation: `import 'dart:math';`

### Front-end

First things first, all the front-end of the product should follow the design of the mock-up, available [here](https://www.figma.com/design/juw1xMWP0mUO0F4TyaW9jz/Flutter-Project?node-id=0%3A1&t=prqGkHnUDQfi96h2-1).

#### SafeArea

The class SafeArea insets its only child by sufficient padding to avoid intrusions by the operating system.

We use it this way:

```dart

/*
  Scaffold showing how to initiate SafeArea
*/

return Scaffold(
  child: SafeArea(
    // my code, with one child.
  ),
);

```

It has to be used when an element should be safe from the edge of the screen for example.

Without SafeArea:

![withoutsafearea](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/e5fabfd8-9bb0-4d10-9d46-96de7daa5178)

With SafeArea:

![withsafearea](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/4103b603-2943-4aa9-b488-da29fccfb36d)

#### Images

The images used for the development have to be in a dedicated folder, following this convention: `assets/images/MyImage.png`.

The file `pubspec.yaml` needs to contain these lines to add the assets:

```yaml

# Assets

flutter:
  assets:
    - assets/images/

```

Then, you can use the assets using:

```dart

/*
  Image showing how to use assets
*/

Image.asset('assets/images/MyImage.png'),

```

#### Sizes

The elements' size has to be set taking into consideration the screen size.
It will help us export the application to different devices with different screen sizes.

We can take it by coding this, where `size` contains the size of the screen:

```dart

/*
  Widget showing the initialization of the screen size's variable
*/

Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    // your code
}

```

You can initiate it at the beginning of the app, and then import this Size variable to the different pages.

Once you've done this initialization, you can use the variable to set the size of all the elements:

```dart

/*
  Container showing the use of the screen size
*/

Container(
  width: size.width * 0.5,
),

```

#### Text Font

The text font in the application has to be the Google Font Poppins.

You need to import the right package:

`import 'package:google_fonts/google_fonts.dart';`

And then, you can add the font to a Text:

```dart

/*
  Text showing the use of a font
*/

Text(
  'this is a text',
  style: GoogleFonts.poppins(
    // some text adjustments
  ),
),

```

#### TextStyle Reusability

TextStyles can be initialized and reused, enhancing code readability and performance.
Though you first need to initialize a TextStyle:

```dart

/*
  TextStyle for showing the initialization of a reusable TextStyle
*/

final TextStyle poppinsStyle = GoogleFonts.poppins(
  fontSize: 16,
  color: Colors.black,
);

```

And you can then reuse it overtime with multiple Text:

```dart

/*
  Text showing the use of a reusable TextStyle
*/

Text(
  'This is a text',
  style: poppinsStyle,
),

Text(
  'This is another text.',
  style: poppinsStyle,
),

```

#### Swipe Cards

To simulate the swipe cards system, we'll animate containers to create smooth animations. The card can be swiped right and left for different responses. Currently it has to support the following responses:

- Right swipe for like
- Left swipe for dislike

We'll need to initialize the variables and methods (in a Stateful Widget):

```dart

// initialize the offsets variables
Offset _startDragOffset = Offset.zero;
Offset _currentOffset = Offset.zero;

// _onPanStart sets the offset as the current location when the container begins to move
void _onPanStart(DragStartDetails details) {
  _startDragOffset = details.localPosition;
}

// _onPanUpdate sets the offset of the current location each frame of the movement
void _onPanUpdate(DragUpdateDetails details) {
  setState(() {
    _currentOffset = details.localPosition - _startDragOffset;
    if (_isSelected()) {
      debugPrint("Swiped to the right");
    }
    if (_isRejected()) {
      debugPrint("Swiped to the left");
    }
  });
}

// _onPanEnd sets the offset as the center of the screen
void _onPanEnd(DragEndDetails details) {
  setState(() {
    _currentOffset = Offset.zero;
  });
}

// detects if the half of the card is on the right
bool _isSelected() {
  return _currentOffset.dx != 0 && _currentOffset.dx > 150;
}

// detects if the half of the card is on the left
bool _isRejected() {
  return _currentOffset.dx != 0 && _currentOffset.dx < -150;
}

```

Then, you can use the swipe cards following the next piece of code:

```dart

/*
  GestureDetector showing the use of swipe cards
  - containing the methods initialized above
  - the offset of the container is set as the position used in the methods
  - the cards has to be dismissed swiping to the left (like) or to the right (dislike)
*/

GestureDetector(
  onPanStart: _onPanStart,
  onPanUpdate: _onPanUpdate,
  onPanEnd: _onPanEnd,
  child: Transform.translate(
    offset: _currentOffset,
    child: Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          'Tinder Card',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    ),
  ),
),

```

### Back-end

#### Routes

Routes are used to navigate through the application's pages.
We initialize the Language Page, the Redirection Page and the Login Page in this example:

```dart

import 'package:go_router/go_router.dart'; // importation of the dependencies

/*
  routes showing their initialization
*/

final routes = GoRouter(
  routes: [
    GoRoute(
      path: "/languagehomepage",
      name: "LanguageHomePage",
      builder: (BuildContext context, GoRouterState state) ->  LanguageHomePage(storage: GetUserData()),
    ),
    GoRoute(
      path: "/",
      name: "RedirectionPage",
      builder: (BuildContext context, GoRouterState state) ->  RedirectionPage(storage: DocumentStorage()),
    ),
    GoRoute(
      path: "/loginpage",
      name: "LoginPage",
      builder: (BuildContext context, GoRouterState state) ->  LoginPage(storage: DataClass()),
    ),
  ]
);

```

You can now call the route to switch pages.
Here's how you can navigate to routes (here, to the Login Page):

```dart

/*
  OnTap function showing the use of routes
  - if OnTap is triggered, the page changes to the LoginPage.
*/

onTap(){
  setState(() {
    context.go("/loginpage");
  });
},

```

#### Maps

The maps are used as collections of key/value pairs, from which you retrieve a value using its associated key.

We'll use them concerning the application's language and theme.

**Maps for language**

Initialization:

```dart

/*
  Map showing their initialization for language
*/

Map<String, String> loginLang = {
  "fr_FR": "Connection",
  "en_US": "Login",
};

```

Use:

```dart

/*
  Text showing the use of language maps
*/

Text(
  "${loginLang[appLang]}", // appLang is the chosen language, fr_FR or en_US then
  style: GoogleFonts.poppins(
    // some text adjustments
  ),
),

```

**Maps for theme**

Initialization:

```dart

/*
  Map showing their initialization for themes
*/

Map<String, Color> buttonColor = {
  "dark_Theme": Colors.white,
  "light_Theme": Colors.black,
};
```

Use:

```dart

/*
  Container showing the use of theme maps
*/

Container(
  color: ${buttonColor[appTheme]}, //appTheme is the current theme, dark_Theme or light_Theme then
),

```

#### Database and Data Flow

The user data will be stocked and supplied mainly by databases and API requests.

Name of the database: *ffeur.pq.lu/*
IP of the database: *185.221.182.215*

**Login Data Flow**

The database manages many parameters during the login phase:

- A random MacAddress, dedicated to a specific device.
When the application is launched on a new device, a new random MacAddress is generated.

- The language of the application.
The language can be changed in the settings.

- The user ID.
The user ID is unique to a single user.

- The last and current connection.
Both parameters are compared, to enhance the security.

- The last and current position of connection.
Both parameters are compared, to enhance the security.

- The last and current IPV4.
Both parameters are compared, to enhance the security.

If the time from the last connection to the current one is below 15min, the position from the last connection to the current one is below 15km, and the IPV4 from the last connection to the current one doesn't differ, no need to log in again.

Here's a diagram that should be more understandable:
![logintechnicaldiagram](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/0095d9da-9ac0-47fb-b9aa-70138a1354f9)

**Account Data Flow**

The database will stock all the information about the user account (as strings):

Candidate's side:

- The candidate's ID
- The candidate's first name and last name
- The candidate's date of birth
- The candidate's city of birth
- The candidate's city of residence
- The candidate's email address
- The candidate's password
- The candidate's soft skills
- The candidate's current job
- The candidate's job's expectation

Company's side:

- The company's ID
- The company's full name
- The company's brand name
- The company's email address
- The company's password
- The company's HR members
- The company's job's expectation
- The company's soft skills' expectation

**Account's Likes/Match Data Flow**

The account's likes will be managed in a dedicated database, linked with the user ID.
The likes' system is only for candidates, which means "Likes" are companies' names (strings) the candidate liked.

When a candidate likes a company and the candidate's soft skills are similar enough to the company's expectations, a match occurs.
Each time a candidate likes a company, once the company's name has been put in the database, we need to check if the candidate's soft skills match the company's expectations.

![matchdiagram](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/108c08c3-356c-4936-8057-05db9618cee0)

**Account's Chat Flow**

The account's chat will be managed in a dedicated database, linked with the user ID.
The database will stock all the information about the chat (as strings):

Both candidate's and company's side:

- The user's ID
- The chat's ID
- The second user's ID
- The message's content

![databaseslink](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/3f5cf5d2-4df9-4519-90ed-5921cc200a64)

We'll not use databases' array because dedicated databases were chosen for specific purposes, due to their security and ease of use (the project was not intended to contain a back-end system).
They are, however, linked to the main database with the user's ID, which enhances performance.

#### Error handling

Error handling is a powerful way to debug and enhance the maintainability of the code.
`print(""),` and `debugPrint("");` are useful to know if the workflow is going as expected.

```dart

/* 
  Function to check the MacAddress.
  - Sends the URL to the database
  - Checks the response
  - Prints if the response is successful or not
*/

Future<bool> checkMacAddress() async {
  try {
    final file = await fileLocalization;
    String content = await file.readAsString();
    print("Checking MAC address: $content");
    final response = await macDatabase(content);
    print("URL Sended");
    if (response.statusCode == 200) {
      // successful response
      print("Response successful.");
    } else {
      // failed response
      print("Error: HTTP status ${response.statusCode}");
    }
  } catch (e) {
    print("Error on checking mac address on database: $e");
  }
  return false;
}
```

## Security

The security is an important part of the back-end management, concerning databases and user data.

Here are some elements that have to be implemented to enhance security:

- The database will be accessible only with a specific token.
- The accessibility token changes everyday.
- The user's password will be encrypted to prevent theft of the account (following the Caesar cipher).

## Glossary

In software engineering, the terms **front-end** and **back-end** (sometimes written as back end or back-end) refer to the separation of concerns between the presentation layer (front-end), and the data access layer (back-end) of a piece of software. | [Wikipedia](https://en.wikipedia.org/wiki/Frontend_and_backend)

An **Application Programming Interface (API)** is a way for two or more computer programs or components to communicate with each other. | [Wikipedia](https://en.wikipedia.org/wiki/API)

**ASCII** is an acronym for American Standard Code for Information Interchange, is a character encoding standard for electronic communication. ASCII codes represent text in computers, telecommunications equipment, and other devices. | [Wikipedia](https://en.wikipedia.org/wiki/ASCII)

An **Integrated Development Environment (IDE)** is a software application that provides comprehensive facilities for software development. An IDE normally consists of at least a source-code editor, build automation tools and a debugger. | [Wikipedia](https://en.wikipedia.org/wiki/Integrated_development_environment)

Written in C, C++ and Dart, **Flutter** is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web,[4] Fuchsia, Android, iOS, Linux, macOS, and Windows. | [Wikipedia](https://en.wikipedia.org/wiki/Flutter_(software))

Flutter contains a few **channels**: master, beta and stable; in increasing order of stability. | [Source](https://github.com/flutter/flutter/wiki/flutter-build-release-channels)

In computing, a **database** is an organized collection of data based on the use of a database management system (DBMS), the software that interacts with end users, applications, and the database itself to capture and analyze the data. | [Wikipedia](https://en.wikipedia.org/wiki/Database)

An **Application Programming Interface (API)** is a way for two or more computer programs or components to communicate with each other. | [Wikipedia](https://en.wikipedia.org/wiki/API)

In cryptography, a **Caesar cipher** is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. | [Wikipedia](https://en.wikipedia.org/wiki/Caesar_cipher)
