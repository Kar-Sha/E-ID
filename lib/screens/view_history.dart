import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';
import 'attendance.dart';

final User? user = FirebaseAuth.instance.currentUser;
final String uid = user!.uid;
final DatabaseReference timeRef =
    FirebaseDatabase.instance.ref('courses').child(getCode()).child(getID());
final DatabaseReference idRef1 =
    FirebaseDatabase.instance.ref('students').child(uid).child('student_id');
var date = '';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //app bar
              TextButton(
                onPressed: () async {
                  goToPageAndRemoveFromStack(
                      context, MyAppRouteConstants.homeRouteName);
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
                      "History",
                      style: TextStyle(fontSize: 28),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Card Scan and Use',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    FutureBuilder(
                      future: Future.wait([getDate()]),
                      builder: ((context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.hasData) {
                          date = snapshot.data![0];
                        } else {
                          //date = '';
                          //print(getCode());
                          print(getID());
                          print(date);
                          //print(timeRef);
                        }
                        return Text(
                          "Course ID:                                 Date:\n\n" +
                              getCode() +
                              "                                           " +
                              date,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Object?> getDate() async {
    DatabaseEvent event = await timeRef.once();
    Object? result = event.snapshot.value;
    return result;
  }

  Future<Object?> getStudentID() async {
    DatabaseEvent event = await idRef1.once();
    Object? result = event.snapshot.value;
    return result;
  }
}
