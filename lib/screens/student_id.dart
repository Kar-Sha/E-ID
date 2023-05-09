// Select School
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:local_auth_ex/screens/get_started.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/onboarding.dart';

class StudentID extends StatefulWidget {
  const StudentID({Key? key}) : super(key: key);

  @override
  State<StudentID> createState() => _StudentID();
}

class _StudentID extends State<StudentID> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) => Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/images/background.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => GetStarted()),
                      );
                    },
                    child: const Text(
                      "Back",
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(children: [
                    Text("Enter Your School ID",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    SizedBox(height: 30.0),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: const Text(
                        "Next",
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 16),
                        backgroundColor: Colors.grey[700],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ));
}
