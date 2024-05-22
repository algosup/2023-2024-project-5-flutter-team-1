# Functional Specifications: ADOPT A CANDIDATE Project

## Table of Contents
- [Functional Specifications: ADOPT A CANDIDATE Project](#functional-specifications-adopt-a-candidate-project)
  - [Table of Contents](#table-of-contents)
  - [1. Document Control](#1-document-control)
    - [1.1 Document Approval](#11-document-approval)
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
    - [7.1 User Interface For JobSeekers](#71-user-interface-for-jobseekers)
    - [7.2 User Interface For Companies](#72-user-interface-for-companies)
    - [7.3 Navigation Flow](#73-navigation-flow)
    - [Initial Flow for Jobseekers](#initial-flow-for-jobseekers)
    - [Initial Flow for Companies](#initial-flow-for-companies)
  - [8. Hardware Interfaces](#8-hardware-interfaces)
  - [9. Configurability and Compatibility](#9-configurability-and-compatibility)
  - [10. Installation](#10-installation)
  - [11. Usability](#11-usability)
  - [12. Security](#12-security)
  - [13. Performance Requirements](#13-performance-requirements)
  - [14. Privacy and Data Protection](#14-privacy-and-data-protection)
  - [15. Compliance](#15-compliance)
  - [Glossary](#glossary)


## 1. Document Control

### 1.1 Document Approval

| Role | Name | Date | Signature |
| --- | --- | --- | --- |
| Project Manager | Serena BAVAROIS |  | <center>❌</center> |
| Program Manager | Wilfried PORTET |  | <center>❌</center> |
| Technical Leader | Enzo GUILLOUCHE |  | <center>❌</center> |
| Software Engineer | Guillaume DERAMCHI |  | <center>❌</center> |
| Technical Writer | Elone DELILLE |  | <center>❌</center> |
| Quality Assurance | Mattéo LEFIN |  | <center>❌</center> |

## 2. Overview

This document aims to provide a comprehensive overview of the "Adopt a Candidate" application. This application serves as a bridge between jobseekers and companies, with a unique feature of anonymity to prevent any form of discrimination. The app focuses on matching soft skills rather than qualifications. The project's scope involves the development of key features such as user account creation, a matching algorithm, and job posting management. This document will serve as a roadmap, detailing each facet of the application for clarity and understanding.

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
- Jobseekers will be able to search for soft skills through a search bar.
    - In case the soft skills they want to add don't exist in the database, they can create it.
- Allow companies to specify the soft skills they are looking for via checkboxes or search bar.

### 2.3 User Roles

**Intended users of the software:**

- **Job Seekers:** Citizens seeking employment, whether skilled or low-skilled, by highlighting their soft skills rather than formal qualifications. The goal is to help jobseekers find positions that match their soft skills.
- **Companies:** Businesses of all sizes looking to attract candidates with the appropriate soft skills for available positions.

### 2.4 Use Cases for All Operations

**Typical usage scenarios and tasks:**

### 2.4.1 Jobseekers Side

Typical steps for jobseekers:

1. Download the application.
2. Select the preferred language for the application's text.
3. Create an account by providing personal information.
4. Select relevant soft skills via the search bar.
5. Specify the geographical area for job searching.
6. Access the homepage to view companies currently hiring for the selected soft skills.
7. On the homepage the jobseeker must like the company to initiate the match.
8. Then the jobseeker needs to wait for a company to start a conversation.

**Example: Jobseeker's experience**

```markdown
Scenario: A candidate uses the application.
- Given: The candidate has downloaded the application and chosen his language.
- When: The candidate enters personal information and selects soft skills.
- Then: The candidate sees companies looking for his skills.

Example:
- Soft Skills Needed: Teamwork
- Soft Skill of the Applicant: Collaboration
- Result: Match succeeded because collaboration is a subskill of teamwork.

```

### 2.4.2 Company Side

Typical steps for companies:

1. Download the application on a computer.
2. Select the preferred language for the application's text.
3. Create an account by providing company information.
4. Access the homepage.
5. Post job advertisements on the app.
6. When posting a job advertisement the company gives their preferred soft-skills, and if a jobseeker likes a company with which the soft skills are compatible, the match appears.
7. Wait for applications from candidates.
8. Review anonymous candidate profiles based on soft skills.
9. The company decides to send a message to the jobseeker afterwards.

**Example: Company's experience**

```markdown
Scenario: A company publishes a job offer and seeks soft skills.
- Given: The company downloaded the app and chose its language.
- When: The company enters the details of the job offer and selects the soft skills required.
- Then: The company sees anonymous candidates matching the sought-after skills.

Example:
- Skill sought: Oral communication
- Candidate's competence: Oral communication
- Result: Match because the candidate has the skills sought by the company.

```

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
  - Personal information,
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

### 7.1 User Interface For JobSeekers
- **Choose Your Language Screen**
-   ![Screenshot 2024-05-22 151134](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145995592/3e214f65-3c45-42b7-ad68-eb8160aadaf8)

- **Registration Screen**
-   ![Screenshot 2024-05-22 151230](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145995592/5b1f1ee7-2e1d-4eab-aac1-5aac6f76a103)

- **Login Screen**
-   ![Screenshot 2024-05-22 151333](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145995592/b1bb4df8-6aae-4918-9e42-d2424f9c6e82)

### 7.2 User Interface For Companies

- Registration Screen
-   ![Screenshot 2024-05-22 162147](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145995592/3cfcca0f-7e65-45db-bfeb-6057985e1bef)
  ![Screenshot 2024-05-22 162212](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145995592/2adcbb35-cf9e-42b4-93cc-16e54abc71d0)

- Login Screen
-   ![Screenshot 2024-05-22 162130](https://github.com/algosup/2023-2024-project-5-flutter-team-1/assets/145995592/99d4dee8-4315-4666-aa5d-32fecc3b5a68)


### 7.3 Navigation Flow

### Initial Flow for Jobseekers

- **For a New User:**
    - Choose Your Language Screen → Registration Screen → Home Screen
        - Home Screen: The user can browse job postings, update their profile, and view matched companies.
- **For a User Who Already Has an Account:**
    - Login Screen → Home Screen
        - Home Screen: The user can directly access job postings, update their profile, and view matched companies.

### Initial Flow for Companies

- **For a New Company:**
    - Choose Your Language Screen → Registration Screen → Company Dashboard
        - Company Dashboard: The company can create and manage job postings, view matched candidates, and communicate with candidates.
- **For Companies Who Already Have an Account:**
    - Login Screen → Company Dashboard
        - Company Dashboard: The company can directly access and manage job postings, view matched candidates, and communicate with candidates.

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

## 12. Security

- **Access Control:** Ensure that different user roles (e.g., jobseekers, companies, admins) have appropriate access controls to prevent unauthorized access to sensitive data.

## 13. Performance Requirements

- **Scalability:** The application must be able to scale horizontally to handle a growing number of users and data.
- **Response Time:** The system should respond to user actions within 2 seconds for 95% of the requests.

## 14. Privacy and Data Protection

- **Data Anonymization:** Ensure that all user data is anonymized to protect user identities.
- **Data Retention Policy:** Implement a data retention policy to ensure that user data is stored only for as long as necessary and is securely deleted thereafter.
- **User Consent:** Obtain explicit user consent for data collection and processing in compliance with GDPR and other relevant privacy regulations.

## 15. Compliance

- **GDPR:** Ensure compliance with the General Data Protection Regulation for users in the European Union.

## Glossary

| Term                 | Definition                                                                                                                   |
|----------------------|------------------------------------------------------------------------------------------------------------------------------|
| Jobseeker            | An individual seeking employment through the application. Intended to find positions that match their soft skills.           |
| Company              | A business entity looking to recruit candidates through the application. Focused on identifying suitable candidates by soft skills. |
| Soft Skills          | Non-technical skills that relate to how one works, such as teamwork, communication, and problem-solving.                      |
| Match                | A successful pairing of a jobseeker's soft skills with a company's requirements, initiated by mutual interest in the app.    |
| Anonymity            | The state of being anonymous; ensures that jobseeker identities are not disclosed to companies until a mutual interest is established. |
| Matching Algorithm   | The backend software mechanism that pairs jobseekers with job opportunities based on a comparison of soft skills and company requirements. |
| Data Encryption      | The process of converting information or data into a code, especially to prevent unauthorized access.                        |
| GDPR                 | General Data Protection Regulation; EU legislation that protects personal Data and privacy in the European Union.            |
| UI                   | User Interface; the means through which a user interacts with a software or hardware system.                                 |
| UX                   | User Experience; encompasses all aspects of the end-user's interaction with the company, its services, and its products.     |
| Scalability          | The capability of a system to handle a growing amount of work, or its potential to be enlarged to accommodate that growth.   |
| Response Time        | The amount of time a system or functional unit takes to react to a given input.                                              |
| Data Anonymization   | The process of either encrypting or removing personally identifiable information from data sets, so that the people whom the data describe remain anonymous. |
| Data Retention Policy| The set of guidelines that a company follows to determine how long it will retain different types of data.                   |
| Accessibility        | The design of products, devices, services, or environments for people with disabilities.                                     |
| Compliance           | Adherence to laws, regulations, guidelines and specifications relevant to the business process.                              |
| Configuration        | The arrangement of elements in a particular piece of software or the settings available to customize a device.               |


---
