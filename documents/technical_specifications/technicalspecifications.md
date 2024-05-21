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
      - [Organisation](#organisation)
    - [Coding](#coding)
      - [Comments](#comments)
      - [Formatting](#formatting)
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
    - [Back-end](#back-end)
      - [Routes](#routes)
      - [Maps](#maps)
      - [Database and Data Flow](#database-and-data-flow)
  - [Security](#security)
  - [Glossary](#glossary)

</details>

## Audience

**This document is primarily intended for:**

- Software Engineers:
    to understand the user and technical requirements, and to guide their work. Help them understand challenges and choices made.

## Overview

Adopt A Candidate is a "Tinder style" recruitment application that matches companies with jobseekers in a different way.
We'll code it using Flutter, all the technical specificities are described [here](#technical-architecture).

### Requirements

- The application will need to be available on phone, and PC.
- **The phone format will be dedicated to candidate's use:**
  - This format promotes the swipe system, the user just has to swipe and receive a message from a company when he matches with it.
- **The PC format will be dedicated to a company's use.**
  - This fomat promotes the chat managing system, the company just gets notified when it matches with a jobseeker and they can send the first message to the jobseeker, initiating the discussion.

### Nice To Have

- The phone and PC application can be used either by a candidate or a company.
- Some back-end using a database to store data.
- APIs concerning choices in the registration.

### Priorities

- The front-end of the application.
- The compatibility with different devices.

## Conventions

### Naming

The naming conventions are explained in the [dedicated file](../../conventionsandrules.md).

### GitHub

#### Organisation

- Each pull-request has to contain labels, the project, the dedicated milestone, and at least 2 reviewers.
- Each issue has to contain labels, the project, the dedicated milestone, and the assigned member.
- The working version of the project goes into the *Release* branch.
- Release should be made from the main.
- The main branch should be updated at least once a day (when the team is in project-time).
- There can't be any direct push to the main. The member has to do a pull-request to merge their changes in the main.
- Only push code that has been tested (working code).

### Coding

#### Comments

The rule concerning comments is explained in the [conventions and rules file](../../conventionsandrules.md).

#### Formatting

- You can format automatically your .dart files using *Shift* + *Alt* + F.
- Avoid to create too long lines.
- Avoid non-ASCII characters.

Here's an example of the formatting rules:

```dart
Widget example(String word, int number){
    //write your piece of code here
}
```

## Technical Architecture

### Technology Used

#### Supported Platforms

As of the current release, Flutter supports the following platforms as part of Google-tested and best-effort platform tier:

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

Phones and PCs can be used to debug Flutter code, either on Android, IOS and PC. There are some requirements that need to be done though, and in a certain range of device:

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

You can now access to the Developer's settings.

- Authorize USB Debug mode

>Search Debug in the Settings.<br>
Go to USB Debug.<br>
Enable USB Debug, regardless the warnings.

You can now Debug on your device.

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

Run and debug Flutter code on PC is quite easier than on phones.
You already have a device named by your OS:

![destop-device](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/e2e8be53-6a52-4d89-8f2d-1d9126ab362c)

You can directly run and debug on it, no need to setup something else.

Also, you can use virtual devices on your PC, whether it is IOS or Android-based.
Some of these emulators are already integrated to Android-Studio and else, however you sometimes have to create it by yourself.

#### Software

Here's the IDE that we'll use:

- Visual Studio Code | version 1.89.1 or newer (mainly used)
- Android Studio Jellyfish | 2023.3.1 or newer

We'll use Dart version 3.4.0 or newer and Flutter version 3.22.0 or newer (visible if you run `flutter doctor -v` in your terminal).

**Dependencies:**

- Flutter SDK.
  - already setup if there's no issues in the flutter doctor summary.
- Flutter widget package implementing Material design.
  - importation: `import 'package:flutter/material.dart'`
- Flutter router package implementing pages navigation.
  - importation: `import 'package:go_router/go_router.dart';`
- Flutter IOS package implementing IOS design.
  - importation: `import 'package:flutter/cupertino.dart';`

### Front-end

First things first, all the front-end of the product should follow the design of the mock-up, available [here](https://www.figma.com/design/juw1xMWP0mUO0F4TyaW9jz/Flutter-Project?node-id=0%3A1&t=prqGkHnUDQfi96h2-1).

#### SafeArea

The class SafeArea insets its only child by sufficient padding to avoid intrusions by the operating system.

We use it this way:

```dart
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

The file `pubspec.yaml` needs to contain this lines to add the assets:

```yaml
flutter:
  assets:
    - assets/images/
```

Then, you can use the assets using:

```dart
Image.asset('assets/images/MyImage.png'),
```

#### Sizes

The elements' size has to be set taking in consideration the screen size.
It will help us exporting the application to different device with different screen sizes.

We can take it coding this, where `size` contains the size of the screen:

```dart
Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    // your code
}
```

You can initiate it at the beginning of the app, and then import this Size variable to the different pages.

Once you've done this initialization, you can use the variable to set the size of all the elements:

```dart
Container(
  width: size.width * 0.5,
),
```

#### Text Font

The text font in the application has to be the Google Font Poppins.
Here's how you can add correctly the font:

```dart
Text(
  // your text
  style: GoogleFonts.poppins(
    // some text adjustments
  ),
),
```

### Back-end

#### Routes

Routes are used to navigate through the application's pages.
We initialize the Language Page, the Redirection Page and the Login Page in this example:

```dart
import 'package:go_router/go_router.dart';

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
Map<String, String> loginLang = {
  "fr_FR": "Connexion",
  "en_US": "Login",
};
```

Use:

```dart
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
Map<String, Color> buttonColor = {
  "dark_Theme": Colors.white,
  "light_Theme": Colors.black,
};
```

Use:

```dart
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

- a random MacAddress, dedicated to a specific device.
When the application is launched on a new device, a new random MacAddress is generated.

- the language of the application.
The language can be changed in the settings.

- the user ID.
The user ID is unique to a single user.

- the last and current connexion.
Both parameters are compared, to enchance the security.

- the last and current position of connexion.
Both parameters are compared, to enchance the security.

- the last and current IPV4.
Both parameters are compared, to enchance the security.

If the time from the last connexion to the current one is below 15min, the position from the last connexion to the current one is below 15km, and the IPV4 from the last connexion to the current one doesn't differ, no need to login again.

Here's a diagram that should be more understandable:
![logintechnicaldiagram](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/0095d9da-9ac0-47fb-b9aa-70138a1354f9)

**Account Data Flow**

The database will stock all the information about the user account (as strings):

Candidate's side:

- the candidate's ID
- the candidate's first name
- the candidate's last name
- the candidate's date of birth
- the candidate's city of birth
- the candidate's city of residence
- the candidate's email address
- the candidate's password
- the candidate's soft skills
- the candidate's current job
- the candidate's job's expectation

Company's side:

- the company's ID
- the company's full name
- the company's brand name
- the company's email address
- the company's password
- the company's HR members
- the company's job's expectation
- the company's soft skills' expectation

**Account's Likes Data Flow**

The account's likes will be managed in a dedicated database, linked with the user ID.

The likes' system is only for candidates, that means "Likes" are companies' names the candidate liked.

**Account's Chat Flow**

The account's chat will be managed in a dedicated database, linked with the user ID.
The database will stock all the information about the chat (as strings):

Both candidate and company's side:

- the user's ID
- the chat's ID
- the second user's ID
- the message's content

We'll not use databases' array because dedicated databases were chosen for specific purposes, due to their security and ease of use (the project was not intended to contain a back-end system).
They are, however, linked to the main database with the user's ID, which enhances performance.

## Security

The security is an important part of the back-end management, concerning databases and user data.

Here's some elements that have to be implemented to enhance the security:

- The database will be accessible only with a specific token.
- The accessibility token changes everyday.
- The user's password will be encrypted to prevent a theft of account (following the Caesar cipher).

## Glossary

In software engineering, the terms **front-end** and **back-end** (sometimes written as back end or back-end) refer to the separation of concerns between the presentation layer (front-end), and the data access layer (back-end) of a piece of software. | [Wikipedia](https://en.wikipedia.org/wiki/Frontend_and_backend)

An **Application Programming Interface (API)** is a way for two or more computer programs or components to communicate with each other. | [Wikipedia](https://en.wikipedia.org/wiki/API)

**ASCII** is an acronym for American Standard Code for Information Interchange, is a character encoding standard for electronic communication. ASCII codes represent text in computers, telecommunications equipment, and other devices. | [Wikipedia](https://en.wikipedia.org/wiki/ASCII)

An **Integrated Development Environment (IDE)** is a software application that provides comprehensive facilities for software development. An IDE normally consists of at least a source-code editor, build automation tools, and a debugger. | [Wikipedia](https://en.wikipedia.org/wiki/Integrated_development_environment)

Written in C, C++ and Dart, **Flutter** is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web,[4] Fuchsia, Android, iOS, Linux, macOS, and Windows. | [Wikipedia](https://en.wikipedia.org/wiki/Flutter_(software))

Flutter contains few **channels**: master, beta and stable; in increasing order of stability. | [Source](https://github.com/flutter/flutter/wiki/flutter-build-release-channels)

In computing, a **database** is an organized collection of data based on the use of a database management system (DBMS), the software that interacts with end users, applications, and the database itself to capture and analyze the data. | [Wikipedia](https://en.wikipedia.org/wiki/Database)

An **Application Programming Interface (API)** is a way for two or more computer programs or components to communicate with each other. | [Wikipedia](https://en.wikipedia.org/wiki/API)

In cryptography, a Caesar cipher is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. | [Wikipedia](https://en.wikipedia.org/wiki/Caesar_cipher)
