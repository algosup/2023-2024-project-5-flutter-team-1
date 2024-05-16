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
      - [Software](#software)
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
- The phone format will be dedicated to candidate's use, whereas the PC format will be dedicated to a company's use.

### Nice to have

- The phone and PC application can be used either by a candidate or a company.
- Some back-end[^1] to send requests to an API[^2].

### Priorities

- The front-end[^1] of the application.
- The compatibility with different devices.

## Conventions

### Naming

The naming conventions are explained in the [dedicated file](../../conventionsandrules.md).

### GitHub

#### Organisation

- Each pull-request has to contain labels, the project, the dedicated milestone, and at least 2 reviewers.
- Each issue has to contain labels, the project, the dedicated milestone, and the assigned member.

### Coding

#### Comments

The rule concerning comments is explained in the [conventions and rules file](../../conventionsandrules.md).

#### Formatting

- You can format automatically your .dart files using *Shift* + *Alt* + F.
- Avoid to create too long lines.
- Avoid non-ASCII[^3] characters.

Here's an example of the formatting rules:

```dart
Widget example(String word, int number){
    //write your piece of code here
}
```

## Technical Architecture

### Technology Used

#### Hardware

<!-- TO-DO -->

#### Software

<!-- TO-DO -->

## Front-end

### Key Functionalities

<!-- TO-DO -->

## Back-end

### Key Functionalities

<!-- TO-DO -->

## Security

<!-- TO-DO -->

## Glossary

[^1]: Front-end/Back-end
In software engineering, the terms frontend and backend (sometimes written as back end or back-end) refer to the separation of concerns between the presentation layer (frontend), and the data access layer (backend) of a piece of software. | [Wikipedia](https://en.wikipedia.org/wiki/Frontend_and_backend)

[^2]: API
An application programming interface (API) is a way for two or more computer programs or components to communicate with each other. | [Wikipedia](https://en.wikipedia.org/wiki/API)

[^3]: ASCII
ASCII is an acronym for American Standard Code for Information Interchange, is a character encoding standard for electronic communication. ASCII codes represent text in computers, telecommunications equipment, and other devices. | [Wikipedia](https://en.wikipedia.org/wiki/ASCII)
