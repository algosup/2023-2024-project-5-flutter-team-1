# Functional Specifications: ADOPT A CANDIDATE Project

## Table of Contents

1. [Document Control](#1-document-control)
   1. [Version History](#11-version-history)
   2. [Document Approval](#12-document-approval)
2. [Overview](#2-overview)
   1. [Product Description](#21-product-description)
   2. [Product Functional Capabilities](#22-product-functional-capabilities)
   3. [User Roles](#23-user-roles)
   4. [Use Cases for All Operations](#24-use-cases-for-all-operations)
      1. [User Side](#241-user-side)
      2. [Company Side](#242-company-side)

## 1. Document Control

### 1.1 Version History

| **Version** | **Date**        | **Author**        | **Description**                        |
| ----------- | --------------- | ----------------- | -------------------------------------- |
| 0.1         | 13th May 2024   | Wilfried PORTET   | Initial Draft                          |

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

### 2.1 Product Description

“Adopte un candidat" is a mobile/web application designed to connect candidates and companies while ensuring anonymity to prevent discrimination based on gender, origin, or other factors. The app emphasizes soft skills rather than traditional CVs, aiming to match candidates with companies seeking specific soft skills.

Developed using Flutter 3, and commissioned by "We Are Evolution," this application focuses on collecting and utilizing candidate data effectively.


**Most important features and capabilities**:<br>

- Create a match when a candidate's soft skills align with what a company is seeking.
- Maintain candidate anonymity to prevent potential discrimination.
- Enable companies to post job offers.

---

### 2.2 Product Functional Capabilities


**List of required software functions:**


- Allow both candidates and companies to create accounts.
- Provide a like/dislike system for candidates to express interest in companies.
- Include an administrative interface for companies to manage applications and communicate with candidates.
- Users will be able to search for softskills through a search bar.
And in case the softskills they want to add don't exist in the database, they can create it.
- Allow companies to specify the soft skills they are looking for via checkboxes.

---

### 2.3 User Roles


**Intended users of the software:**


- **Job Seekers:** Citizens seeking employment, whether skilled or low-skilled, by highlighting their soft skills rather than formal qualifications. The goal is to help job seekers find positions that match their soft skills.
- **Companies:** Businesses of all sizes looking to attract candidates with the appropriate soft skills for available positions.

---

### 2.4 Use Cases for All Operations


**Typical usage scenarios and tasks:**

#### 2.4.1 User Side

Typical steps for users:

1. Download the application.
2. Select the preferred language for the application's text.
3. Create an account by providing personal information.
4. Select relevant soft skills via checkboxes.
5. Access the homepage to view companies currently hiring for the selected soft skills.
6. Specify the geographical area for job searching.
7. If a company expresses interest in the user’s profile, the connection process begins.

---

#### 2.4.2 Company Side

Typical steps for companies:

1. Download the application on a computer or mobile device.
2. Select the preferred language for the application's text.
3. Create an account by providing company information.
4. Access the homepage.
5. Create job offers by specifying the required soft skills and geographical location.
6. Post job advertisements on the app.
7. Wait for applications from candidates.
8. Review anonymous candidate profiles based on soft skills.
9. Create a match if interested in a candidate's profile.
10. Communicate with the candidate through the app’s chat feature.
