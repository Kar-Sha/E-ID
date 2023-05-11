import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/new_login.dart';
import 'package:local_auth_ex/screens/settings.dart';
import 'package:local_auth_ex/widgets/home_list.dart';
import 'package:local_auth_ex/widgets/tower_back.dart';
import 'package:local_auth_ex/widgets/tower_id.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _Questions();
}

class _Questions extends State<Questions> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //app bar

            TextButton(
              onPressed: () async {
                goToPageAndRemoveFromStack(context, MyAppRouteConstants.homeRouteName);
              },
              child: const Text(
                "Back",
              ),
              style: TextButton.styleFrom(
                primary: Colors.grey,
                textStyle: const TextStyle(fontSize: 15),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Frequently Asked Questions",
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'How and when can I get my Tower Card?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Incoming undergraduates, freshmen or transfer, are sent a message via SJSU Messaging approximately one month before theirorientation date inviting them to submit a photo via our online portal myid.sjsu.edu. All students who submit and have their photo approved at least one week before their session should receive their Tower ID Card at the Orientation check-in.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Where do I get a Tower Card?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Student Tower cards are issued at the Tower Card windows 6 through 9 located at the Student Services Center. Present your valid State Drivers License, DMV State ID, Passport, or other government-issued photo ID, at any Tower Card Window. A plastic cardholder will be issued to hold your Tower Card. For transit information, visit Associated Students.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'How much does a Tower card cost?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'The first Tower Card is free, except for Open University and Special Session students. Open University and Special Session students may purchase a Tower ID Card for 5 dollars only if they have paid the Student Association Fee. If your Tower Card is lost, stolen or damaged, replacement cost is 5 dollars. Payment for the Tower Card fee is cash only.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'How do I replace a lost/stolen Tower Card?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Students may email the Bursars Office, call 408-924-1601 or visit in-person the Tower Card windows located in the Student Services Center. Faculty and staff can email university-personnel@sjsu.edu. ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}