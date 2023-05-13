import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';
import 'attendance.dart';

final DatabaseReference timeRef =
    FirebaseDatabase.instance.ref('courses').child(getCode()).child(getID());
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
            child: FutureBuilder(
                future: Future.wait([getDate()]),
                builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.data != null) {
                    date = snapshot.data![0];
                  } else {
                    date = " ";
                  }
                  return Column(
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
                              Text(
                                "Course ID:\n" + getCode() +
                                    "                                    " +
                                    date,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]);
                })),
          ),
        ));
  }

  Future<Object?> getDate() async {
    //await getStudentID();
    DatabaseEvent event = await timeRef.once();
    Object? result = event.snapshot.value;
    return result;
  }
}
