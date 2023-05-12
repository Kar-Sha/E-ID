//include log out, student info

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.info,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () async {
                    goToPageAndRemoveFromStack(context, MyAppRouteConstants.homeRouteName);
                  },
                  icon: Icon(
                    Icons.home_filled,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    goToPageAndRemoveFromStack(context, MyAppRouteConstants.profileRouteName);
                  },
                  icon: Icon(
                    Icons.person,
                    size: 32,
                  ),
                ),
              ],
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //app bar
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "App",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " Information",
                        style: TextStyle(fontSize: 28),
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Copyright 2023',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: 25),

            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'We at E-ID take user privacy and security very seriously. Our application has been designed to prioritize user security and safeguard sensitive personal information. This privacy policy ecplains how we collect, use, and protect your data when you use our app.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We collect the following information when you use our app',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Usage Information: We track when the application is used and being scanned in order to provide history of use.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Biometric Data: We may collect your biometric data such as facial recognition data to provide additional security and prevent unauthorized access to your account.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Thankyou for using E-ID',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}