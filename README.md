# E-ID Version 1.0
## Overview
E-ID is a mobile application that can be run on both ios and android emulators. The purpose of this application is to act as an identification service and resource for SJSU students. The need to continuously have a SJSU ID to access classrooms or take tests has increased as the school implemented more security functions in recent years. E-ID allows one to identify themselves with a press of a button, and camera permissions to match the user to their uploaded SJSU ID photo found within the school’s database. 
## Features
- Firebase Authentication and Profile
- Onboarding System
- Digital Tower Card UI
- Attendance Check-In for Exams with code and facial recognition
- Card Use History
- Frequently Asked Questions about the Tower Card
- Application Information
![Untitled (11 × 8 5 in)](https://github.com/Kar-Sha/E-ID/assets/80297074/16f3ea08-45ac-4b48-9e2f-e03af0a97550)

## Get Started
In order to get all the needed dependencies run
```
flutter pub get
```
These are the default configurations
```
defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.local_auth_ex"
        minSdkVersion 21
        targetSdkVersion 30
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```
To run the application use flutter run in your terminal
```
flutter run
```
## Set up Android Build
Register the flutter application with Firebase by inputting the applicationID found through the android app build.gradle file. Then download the google-services.json file and place it into the app folder.
## Set up IOS build
Biometrics system is built into the applciation properties. For IOS download the GoogleService-info.plist
## Contributions
For further inquiries, feel free to message the following members of our team <br />
Ohreum Kwon, ohreum.kwon@sjsu.edu <br />
Kelly Nguyen, kelly.nguyen01@sjsu.edu <br />
Karan Sharma, karan.sharma01@sjsu.edu <br />

## Demo


https://github.com/Kar-Sha/E-ID/assets/76408122/3390cb04-95a0-4508-87d8-ad45ba82c9ec

<br />
Github Repo: https://github.com/Kar-Sha/E-ID <br />
Copyright © 2023 
Oh Reum Kwon, Kelly Nguyen, and Karan Sharma 
ALL RIGHTS RESERVED 







