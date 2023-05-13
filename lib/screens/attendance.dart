import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_auth_ex/screens/view_history.dart';
import 'package:local_auth_ex/widgets/tower_id.dart';
import '../services/auth.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';

TextEditingController code = TextEditingController();
var id = '';
String getCode() {
  if (code.text != null) {
    return code.text;
  } else {
    return "0000";
  }
}

String getID() {
  return id;
}

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);
  @override
  State<Attendance> createState() => _Attendance();
}

class _Attendance extends State<Attendance> {
  final TextEditingController textEditingController = TextEditingController();
  //TextEditingController code = TextEditingController();
  var now = DateTime.now();
  String timeStamp =
      DateFormat(DateFormat.ABBR_MONTH_DAY).add_jm().format(DateTime.now());

  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('courses');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
            child: FutureBuilder(
              future: Future.wait([getStudentID()]),
              builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.data != null) {
                  id = snapshot.data?[0];
                }
                return SingleChildScrollView(
                    reverse: true,
                    physics: const ClampingScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
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
                                  "Attendance",
                                  style: TextStyle(fontSize: 28),
                                ),
                                SizedBox(height: 50),
                                Text(
                                  'Enter Code',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  controller: code,
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
                                  onPressed: () async {
                                    bool isAuthenticated =
                                await AuthService.authenticateUser();
                            if (isAuthenticated) {
                              upload();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Authentication failed.'),
                                ),
                              );
                            }
                                  },
                                  child: const Text(
                                    "Check-In",
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 16.0,
                                        bottom: 16.0,
                                        left: 130,
                                        right: 130),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 16),
                                    backgroundColor: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]));
              }),
            ),
          ),
        ));
  }

  upload() async {
    try {
      dbRef!.child(code.text).child(id).set(timeStamp).whenComplete(() {
        goToPageAndRemoveFromStack(context, MyAppRouteConstants.homeRouteName);
        getCode();
        getID();
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Object?> getStudentID() async {
    DatabaseEvent event = await idRef.once();
    Object? result = event.snapshot.value;
    return result;
  }
}
