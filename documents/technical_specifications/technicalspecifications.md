# Adopt a Candidate - Technical Specifications

<details>
<summary>Table of Contents

</summary>

- [Adopt a Candidate - Technical Specifications](#adopt-a-candidate---technical-specifications)
  - [Audience](#audience)
  - [Overview](#overview)
    - [Requirements](#requirements)
    - [Nice to have](#nice-to-have)
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
      - [Hardware](#hardware)
        - [Android-based phone](#android-based-phone)
        - [IOS-based phone](#ios-based-phone)
        - [Computer](#computer)
      - [Software](#software)
      - [Emulation](#emulation)
    - [Front-end](#front-end)
      - [Key Functionalities](#key-functionalities)
    - [Back-end](#back-end)
      - [Key Functionalities](#key-functionalities-1)
  - [Security](#security)
  - [Glossary](#glossary)

</details>

## Audience

**This document is primarily intended for:**

- Software Engineers:
    to understand the user and technical requirements, and to guide their work. Help them understand risks and challenges and choices made.

## Overview

Adopt A Candidate is a "Tinder style" recruitment application that matches companies with jobseekers in a different way.

### Requirements

- The application will need to be available on phone, and PC.
- **The phone format will be dedicated to candidate's use:**
  - This format promotes the swipe system, the user just has to swipe and receive a message from a company when he matches with it.
- **The PC format will be dedicated to a company's use.**
  - This fomat promotes the chat managing system<!--, the company just gets notified when it matches with a jobseeker and it can send the first message // the first message is sent automatically to initiate the discussion. -->.

### Nice to have

- The phone and PC application can be used either by a candidate or a company.
- Some back-end to send requests to an API.

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

#### Hardware

Phones can be used to debug flutter code, either on Android and IOS. There are some requirements that need to be done though, and in a certain range of device:

**Flutter needs to be setup correctly**

- Run `flutter doctor` in your terminal

It should display " No issues found! "

Windows:

![flutter-doctor-windows](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/ce6777ed-ccfd-4c6f-b049-d3bbae302309)

Mac:

![flutter-doctor-mac](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145991192/97a09c69-2e59-4dce-a039-02040d0b272c)


If not, it should also display where the issues come from:

##### Android-based phone

**The Android-based device needs to be setup correctly**

- Enable Developer mode

>Go to Settings > System in your device.<br>
Touch About phone.<br>
Touch the Build number field 7 times. You will begin seeing a message as you approach the 7 touches.<br>
Once you did the 7 touches, the message "You are now a developer" will appear.<br>

You can now access to the Developer's settings.

- Authorize USB Debug mode

>Search Debug in the Settings.<br>
Go to USB Debug.<br>
Enable USB Debug, regardless the warnings.

You can now Debug on your device.

##### IOS-based phone

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
Confirm your choice when prompted.<br>

Once the profile has been approved, you can manually install other applications from this developer and open them immediately.

**Your IOS or Android-based device is now visible from your IDE, and you can run and debug your application on it by installing the debug APK built.**

It could be better to debug and test your code on a real portable device, though you can obviously do it on a virtual device.

##### Computer

#### Software

<!-- TO-DO -->

#### Emulation

<!-- TO-DO -->

### Front-end

#### Key Functionalities

<!-- TO-DO -->

### Back-end

#### Key Functionalities

<!-- TO-DO -->

## Security

<!-- TO-DO -->

## Glossary

In software engineering, the terms **frontend** and **backend** (sometimes written as back end or back-end) refer to the separation of concerns between the presentation layer (frontend), and the data access layer (backend) of a piece of software. | [Wikipedia](https://en.wikipedia.org/wiki/Frontend_and_backend)

An **Application Programming Interface (API)** is a way for two or more computer programs or components to communicate with each other. | [Wikipedia](https://en.wikipedia.org/wiki/API)

**ASCII** is an acronym for American Standard Code for Information Interchange, is a character encoding standard for electronic communication. ASCII codes represent text in computers, telecommunications equipment, and other devices. | [Wikipedia](https://en.wikipedia.org/wiki/ASCII)

An **Integrated Development Environment (IDE)** is a software application that provides comprehensive facilities for software development. An IDE normally consists of at least a source-code editor, build automation tools, and a debugger. | [Wikipedia](https://en.wikipedia.org/wiki/Integrated_development_environment)
