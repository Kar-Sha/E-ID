import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/new_login.dart';
import 'package:local_auth_ex/screens/settings.dart';
import 'package:local_auth_ex/widgets/home_list.dart';
import 'package:local_auth_ex/widgets/tower_back.dart';
import 'package:local_auth_ex/widgets/tower_id.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _Attendance();
}

class _Attendance extends State<Attendance> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //app bar

            TextButton(
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
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
                    "Attendance",
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Enter Classroom Code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextButton(
                    onPressed: () async {},
                    child: const Text(
                      "Check-In",
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 130, right: 130),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
