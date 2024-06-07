# <center>Test Plan</center>
----

|Author|Mattéo LEFIN|
|-|-|
|Created|05/16/2024|
|Finished|07/06/2024|

----
<details open>

<summary>Changelog</summary>

## Changelog

|Version|Date|Author|Description|
|-------|----|---|--|
|1.0|05/16/2024|Mattéo LEFIN|Create documents template|
|1.1|05/17/2024|Mattéo LEFIN| - add sub parts and Table of content <br> - start the writing of [1. Introduction](#1-introduction)|
|1.2|05/21/2024|Mattéo LEFIN|- finish [1. Introduction](#1-introduction),  [2. Documentation Reviewing](#2-documentation-reviewing) and [3. Testing strategy](#3-testing-strategy)|
|1.3|05/28/2024|Mattéo LEFIN| - finish [4. Execution strategy](#4-execution-strategy) and [5. Testing management](#5-test-management)|
|1.4|06/04/2024|Mattéo LEFIN| - Add images and finish the document.|
</details>

----

<details open>

<summary>Table of content</summary>

## Table of content
<br>

[**Glossary**](#glossary)

[**1. Introduction**](#1-introduction)
 - [**1.1 Document purpose**](#11-document-purpose)
 - [**1.2 Project purpose**](#12-project-purpose)
 - [**1.3 Customers**](#13-customer)

[**2. Documentation Reviewing**](#2-documentation-reviewing)
 - [**2.1 Document criteria**](#21-document-criteria)
 - [**2.2 Review process**](#22-review-process)

[**3. Testing strategy**](#3-testing-strategy)
 - [**3.1 Tests main goal**](#31-tests-main-goal)
 - [**3.2 Testing field**](#32-testing-field)
 - [**3.3 Testing environment**](#33-testing-environment)
 - [**3.4 Test scope**](#34-test-scope)
 - [**3.5 Testing types**](#35-testing-types)

[**4. Execution strategy**](#4-execution-strategy)
 - [**4.1 Testing criterias**](#41-testing-criterias)
 - [**4.2 GitHub issues**](#42-github-issues)
 - [**4.3 Test cases**](#43-test-cases)
 - [**4.4 Bug tracking schema**](#44-bug-tracking-schema)

[**5. Testing management**](#5-test-management)
 - [**5.1 Tools**](#51-tools)
 - [**5.2 Test design**](#52-test-design)
 - [**5.3 Schedule estimation**](#53-schedule-estimation)
 - [**5.4 Test deliverables**](#54-test-deliverables)





</details>

----

<details open>

<summary>Glossary</summary>

## Glossary

|Term|Definition|Source location|
|-|-|-|
|Flutter|Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows.<br> First described in 2015, Flutter was released in May 2017. Flutter is used internally by Google in apps such as Google Pay and Google Earth as well as by other software developers including ByteDance and Alibaba.|[Wikipedia](https://en.wikipedia.org/wiki/Flutter_(software))|
|Agile development principles|![image](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/146164921/4570761f-ecb2-4b4b-b2ff-a0d734de943a)|This shema comes from the website : [Katalon.com](https://katalon.com/resources-center/blog/agile-testing-methodology)|


</details>

----

<details open>

<summary>1.Introduction</summary>

## 1. Introduction

### 1.1 Document purpose

This document shows the **Quality Assurance activity** to provide **clarity** on the approach taken, The **produced result** and the **conclusion reached** out of this project.


It also demonstrates our **documentation reviewing** and indicates our **testing procedure**, including:

- ***The testing strategy***
  - It outlines **the goals** of the test plan, describes the **testing field**, the **testing environment**, and the **test plan scope** and categorizes the **types of testing** involved. 
- ***The execution strategy***
  - Describe how **tests will be performed**, and the process for any kind of issue or bug encountered during the project period.
- ***The test management***
  - It outlines the procedure for **managing the test logistics** and addressing all events that arise during execution.

### 1.2 Project purpose

The project named "Adopter un candidat" (Adopt a candidate in English) has for purpose of **creating an application that allows users to find a job depending primarily on their soft skills.** The application on the employee side will have a scrolling system like ***Tinder***, meaning it will be a side-scrolling to accept or reject the job offer.

On the company side, the app can also be **used on computers** and will have a completely different design. It will look like a tab where they will see the different "matches" of employees, where they **accept the candidates and can message them,** the new messages will always appear on the top of the tab.

The app has to be made on [***Flutter**](#glossary).

### 1.3 Customer

The project has been commissioned by the company ["We Are Evolution"](https://www.we-are-evolution.com/team) represented by [**Oliver Blonsar**](https://www.linkedin.com/in/olivier-blonsard/) (the employment brand, communication expert and audio-visual expert) and [**Lilou Jourdannaud**](https://www.linkedin.com/in/lilou-jourdannaud-6b0a60220/) (The communication manager).

They made a presentation on how they wanted the application, we didn't receive any mandatory design so we had to make it from scratch.


</details>

----

<details open>

<summary>2. Documentation reviewing</summary>

## 2. Documentation reviewing

### 2.1 Document criteria

The majority of our documents have **the same criteria**, making harmony between them is required for **standardization and a better organization of the project**.

The common criteria are:
- All documents must have a **table of contents**
- Documents must stay **as simple as possible**, making them **short and not too technical as possible**. If technical terms are necessary, a **glossary must be implemented**.
- All the documents are written in **American English**.

### 2.2 Review process

To review the documents we use **GitHub issues** to track any problems like typos or criterias that haven't been addressed.

![image](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/146164921/991aa92e-7ab3-49eb-a513-e496d2a39ffe)

*GitHub issues for the Review of the functional document*


</details>

----

<details open>

<summary>3.Testing strategy</summary>

## 3. Testing strategy

### 3.1 Tests main goal

The main goal behind doing tests is to **ensure that all project criterias are checked**, and possibly enhance the quality of the project for a better user experience.


### 3.2 Testing field

**Flutter works with this WEB platform :**

Chrome 84
Firefox 72.0 
Safari on El Capitan
Edge 1.2.0

***(They will work in the upper version of this web platforms)***

<br>
<br>

**With Flutter, we are limited to the different hardware below:**

|  Platform  |  Version   |
|   :----:   |   :------:   |
| Android | API 16 (Android 4.1) & above |
| IOS | IOS 11 & above |
| Linux | Debian, 64-bit |
| macOS | El Capitan (10.11) & above |
| Windows | Windows 7 & above, 64-bit |


### 3.3 Testing environment

For testing our project we used a **MAC** and a **Windows computer** with an **Android emulator** and an **iPhone emulator** to see in real-time what the app on mobile will look like.

![image](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/146164921/8cbbae56-c2c1-4f23-a256-f3ee82d37364)

*The coding Software on the left and the emulator on the left*


### 3.4 Test scope

**In scope**

- Comprehensive testing of each part of the program, including individual instructions.
- Functional testing of all features and functionalities.
- Identification and validation of expected system behavior.
- User acceptance testing (UAT) for assessing user satisfaction.


### 3.5 Testing types

There are different types of testing :

**Functional testing**

Functional testing is a type of software testing that evaluates the functionality of the program based on specified requirements that have been written in the [Functional Specification](). The program needs to perform as expected, focusing on user-facing features and behaviors. this type of testing includes integration testing, system testing, and user acceptance testing.

**Unit testing**

Unit testing is a type of software testing where we test a small and precise part of the program to see if it works properly.

**Agile testing**

Agile testing aligns with [***Agile development principles**](#glossary), emphasizing continuous feedback, collaboration, iterative testing, test automation, and adaptability to deliver high-quality software in a dynamic and iterative development environment.

</details>

----

<details open>

<summary>4.Execution strategy</summary>

## 4. Execution strategy

### 4.1 Testing Criterias

To ensure that our test  goes as smoothly as possible, we have some testing criteria that we have to fulfill in every test:

- Are tested features in line with the specifications defined in the documents?
<br>
- Does the feature work as intended by the developer?
<br>
- Is this feature easy to use for the user?

### 4.2 GitHub Issues

GitHub issues are created to track any problems in the program or the documents as mentioned in "[**2. Document reviewing**](#2-documentation-reviewing)".

However, compared to documents GitHub issues, tests GitHub issues will be based on the corresponding **test cases**.

### 4.3 Test cases

Test cases are specifications of the execution condition, testing procedure, and expected results that define a single test to be executed to achieve a particular software testing objective.

We also use a system of **labels** to identify the severity of the test cases:

- Critical
- High
- Medium
- Low

<br>

![image](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/146164921/f2daf253-e45d-4dc7-b145-9f71aa217ec1)
*Demonstration on how the taste cases are created*



### 4.4 Bug tracking schema

![image](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/146164921/b6e26386-f4a9-4656-af15-59bcb61d3672)


*Bug tracking schema*

</details>

----

<details open>

<summary>5. Test management</summary>

## 5. Test management

### 5.1 Tools

To manage our test we are using specific tools :

- We use GitHub for test management. Test cases and GitHub issues are updated in the [GitHub Issue section](https://github.com/algosup/2023-2024-project-5-flutter-team-1/issues).
<br>
- Every failed test case caused by a bug will be reported in a GitHub issue with the associated test cases
<br>
- After the developer does the bug fix, the Quality Assurance will test it again in the same way he did last time.

### 5.2 Test design

We have a conforming plan of how we create and process our tests.

![image](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/146164921/0c1ea20b-bfaf-4849-b4d7-6f77aa172ef7)

*Test design schema*


### 5.3 Schedule estimation

We estimated a schedule for the entirety of the testing procedure of this project :

| Task | Time estimation |
|------|-------------:|
|Review functional specifications| 3 hours|
| Review technical specification | 4 hours|
|Create the test plan| 48 hours |
|Create and review test cases|27 hours|
|Execute the test cases|  hours|
|Update test cases status|  hours|
|Create GitHub issues| 4 hours|

### 5.4 Test deliverables

- **Test Plan:** it documents our approach and methodology for testing, explaining how tests will be managed and done.
  
- **Test Cases:** It represent a set of tests created to ensure that our application works as intended.

- **GitHub issue:** This section documents any identified issues encountered during the testing phase.

</details>

----

<details open>

<summary>Document approval</summary>

## Document approval

|Role|Name|Signature|
|----|----|---------|
|Project Manager| BAVAROIS Séréna ||
|Program Manager| PORTET Wilfried ||
|Technical Lead| GUILLOUCHE Enzo ||
|Technical Writer| DELILLE Elone ||
|Software Enginer| DERAMCHI Guillaume ||
|Quality Assurance| LEFIN Mattéo |![image](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/146164921/7926ee24-879c-44b6-bdec-4473bd922e72)
|

</details>
