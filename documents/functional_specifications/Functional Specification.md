# Functional Specifications: ADOPT A CANDIDATE Project

## Table of Contents

- [Functional Specifications: ADOPT A CANDIDATE Project](#functional-specifications-adopt-a-candidate-project)
  - [Table of Contents](#table-of-contents)
  - [1. Document Control](#1-document-control)
    - [1.1 Version History](#11-version-history)
    - [1.2 Document Approval](#12-document-approval)
  - [2. Overview](#2-overview)
    - [2.1 Product Description](#21-product-description)
    - [2.2 Product Functional Capabilities](#22-product-functional-capabilities)
    - [2.3 User Roles](#23-user-roles)
    - [2.4 Use Cases for All Operations](#24-use-cases-for-all-operations)
      - [2.4.1 Jobseekers Side](#241-jobseekers-side)
      - [2.4.2 Company Side](#242-company-side)
  - [3. General Constraints](#3-general-constraints)
  - [4. Design Constraints](#4-design-constraints)
  - [5. Assumptions](#5-assumptions)
  - [6. Specific Function Descriptions](#6-specific-function-descriptions)
    - [6.1 Description](#61-description)
    - [6.2 Inputs](#62-inputs)
    - [6.3 Processing](#63-processing)
    - [6.4 Outputs](#64-outputs)
  - [7. User Interfaces](#7-user-interfaces)
  - [8. Hardware Interfaces](#8-hardware-interfaces)
  - [9. Configurability and Compatibility](#9-configurability-and-compatibility)
  - [10. Installation](#10-installation)
  - [11. Usability](#11-usability)

## 1. Document Control

### 1.1 Version History

| **Version** | **Date**        | **Author**        | **Description**                        |
| ----------- | --------------- | ----------------- | -------------------------------------- |
| 0.1         | 13th May 2024   | Wilfried PORTET   | Initial Draft                          |
| 0.2         | 13th May 2024   | Wilfried PORTET   | Second version                         |

### 1.2 Document Approval

| **Role**          | **Name**          | **Date** | **Signature**        |
| ----------------- | ----------------- | -------- | -------------------- |
| Project Manager   | Serena BAVAROIS   |          | <center>❌</center>  |
| Program Manager   | Wilfried PORTET   |          | <center>❌</center>  |
| Technical Leader  | Enzo GUILLOUCHE   |          | <center>❌</center>  |
| Software Engineer | Guillaume DERAMCHI|          | <center>❌</center>  |
| Technical Writer  | Elone DELILLE     |          | <center>❌</center>  |
| Quality Assurance | Mattéo LEFIN      |          | <center>❌</center>  |

## 2. Overview

The aim of this document is to provide a comprehensive overview of the "Adopt a Candidate" application. This application serves as a bridge between job seekers and companies, with a unique feature of anonymity to prevent any form of discrimination. The app focuses on matching soft skills rather than qualifications. The project's scope involves the development of key features such as user account creation, a matching algorithm, and job posting management. This document will serve as a roadmap, detailing each facet of the application for clarity and understanding.

### 2.1 Product Description

“Adopt a candidate" is a mobile/web application designed to connect candidates and companies while ensuring anonymity to prevent discrimination based on gender, origin, or other factors. The app emphasizes soft skills rather than traditional CVs, aiming to match candidates with companies seeking specific soft skills.

Developed using Flutter 3, and commissioned by "We Are Evolution," this application focuses on collecting and utilizing candidate data effectively.

**Most important features and capabilities:**<br>

- Create a match when a candidate's soft skills align with what a company is seeking.
- Maintain candidate anonymity to prevent potential discrimination.
- Enable companies to post job offers.

### 2.2 Product Functional Capabilities

**List of required software functions:**

- Allow both candidates and companies to create accounts.
- Provide a like/dislike system for candidates to express interest in companies.
- Include an administrative interface for companies to manage applications and communicate with candidates.
- Jobseekers will be able to search for softskills through a search bar.
And in case the softskills they want to add don't exist in the database, they can create it.
- Allow companies to specify the soft skills they are looking for via checkboxes.

### 2.3 User Roles

**Intended users of the software:**

- **Job Seekers:** Citizens seeking employment, whether skilled or low-skilled, by highlighting their soft skills rather than formal qualifications. The goal is to help job seekers find positions that match their soft skills.
- **Companies:** Businesses of all sizes looking to attract candidates with the appropriate soft skills for available positions.

### 2.4 Use Cases for All Operations

**Typical usage scenarios and tasks:**

#### 2.4.1 Jobseekers Side

Typical steps for jobseekers:

1. Download the application.
2. Select the preferred language for the application's text.
3. Create an account by providing personal information.
4. Select relevant soft skills via checkboxes.
5. Specify the geographical area for job searching.
6. Access the homepage to view companies currently hiring for the selected soft skills.
7. On the homepage the job seeker must like the company to initiate the match.
8. If a company expresses interest in the jobseekers profile, the connection process begins.

#### 2.4.2 Company Side

Typical steps for companies:

1. Download the application on a computer.
2. Select the preferred language for the application's text.
3. Create an account by providing company information.
4. Access the homepage.
5. Post job advertisements on the app.
6. When posting a job advertisement the company gives their preferred soft-skills, and if a job seeker likes a company with which the soft skills are compatible, the match appears.
7. Wait for applications from candidates.
8. Review anonymous candidate profiles based on soft skills.
9.  The company decides to send a message to the job seeker afterwards.

## 3. General Constraints

- **Algorithm Limitations:** The matching algorithm must efficiently handle a large number of candidates and job listings without significant performance degradation.
- **User Interface Limitations:** The UI must be designed to be responsive and functional on various screen sizes, ensuring usability on smartphones, tablets, and laptops.
- **Data Limitations:** Ensure that data storage and retrieval are optimized to handle potentially large volumes of user profiles and job postings.

## 4. Design Constraints

- As the app is intended for a very large population, its design should remain simple and intuitive. This will ensure an optimal user experience for both those who are very familiar with the technology and those who are less familiar with it.

## 5. Assumptions

- The application will assume jobseekers and companies have access to a stable internet connection for full functionality.
- Jobseekers will grant necessary permissions for the application to access location data, notifications, and other required services.
- Both jobseekers and companies will provide accurate information during the account creation and profile setup process.

## 6. Specific Function Descriptions

### 6.1 Description

- **Matching Function:** Matches candidates with job postings based on selected soft skills.
- **Profile Management:** Allows jobseekers to create and manage their profiles, including updating personal information and soft skills.
- **Job Posting Management:** Enables companies to create, edit, and manage job postings.

### 6.2 Inputs

- **Candidate Inputs:**
  - Personal information,
  - Location details,
  - Selected soft skills,
  - Job preferences.
- **Company Inputs:**
  - Job descriptions,
  - Required soft skills,
  - Location details.

### 6.3 Processing

- **Matching Algorithm:** Uses a weighted scoring system to match candidate soft skills with job requirements.
- **Data Validation:** Ensures that both companies and jobseekers inputs meet predefined criteria for format, completeness, and accuracy.

### 6.4 Outputs

- **Match Results:**
  - Displays matched job postings to candidates,
  - Matched candidates to companies.
- **Notifications:**
  - Sends alerts to jobseekers when a company starts a chat,
  - Important updates.

## 7. User Interfaces

The navigation flow of the windows, menus, and options is described, along with the expected content of each window. Examples of items included are screen resolutions, color scheme, primary font type and size. Discussion also includes how input validation will be done, and how data will be protected from accidental changes. Specific items are described for each screen such as input fields, control buttons, sizing options, and menus.

You can find all the mockups here → [Mockups on Figma](https://www.figma.com/design/juw1xMWP0mUO0F4TyaW9jz/Flutter-Project?node-id=0%3A1&t=FrH8CO2qv7IewlBk-1)

- First screen :
  - Choose Your Language

## 8. Hardware Interfaces

- To use the "Adopt a Candidate" app, jobseekers must access the app via their smartphone by downloading it from the Apple Store or Play Store. The app will be optimized to work on the following devices:
  - Smartphones with iOS 12 or later.
  - Smartphones with Android 8.0 (Oreo) or later.
  - A stable Internet connection is required to access all the features of the application.
- In a future release, jobseekers will also be able to use the app on their personal computers. The minimum specifications laid down are:
  - Compatible browsers: Google Chrome, Mozilla Firefox, Safari, Microsoft Edge (recent versions).
- For businesses, the platform will be mainly usable with a computer and will require the following equipment:
  - Desktops or laptops with a stable Internet connection.
  - Compatible browsers: Google Chrome, Mozilla Firefox, Safari, Microsoft Edge (recent versions).
- **Hardware Compatibility (Screen size):**
  - The application must be compatible with devices with varying screen resolutions, ranging from small 4-inch screens to large tablet screens of 10 inches or more.
- **Accessibility:**
  - The application should include accessibility features for jobseekers with disabilities, such as compatibility with screen readers and the ability to adjust contrasts and font sizes.

## 9. Configurability and Compatibility

- **Customization:** jobseekers should be able to customize their profiles.
- **Operating Systems:** The application must be compatible with the latest versions of iOS and Android.

## 10. Installation

- **Installation Method:** jobseekers can download the app from their store:
  - Apple Store
  - Play Store

## 11. Usability

- **Error Messages:** Provide clear and actionable error messages to guide users in resolving issues.
- **Input Validation:** Validate inputs in real-time to prevent errors and enhance user experience.
