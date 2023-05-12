//include log out, student info

// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:local_auth_ex/provider/authentication/login_provider.dart';
import 'package:local_auth_ex/widgets/button.dart';
import 'package:local_auth_ex/widgets/tower_id.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final User? user = FirebaseAuth.instance.currentUser;
  final DatabaseReference nameRef =
      FirebaseDatabase.instance.ref('students').child(uid).child('name');
  final DatabaseReference idRef =
      FirebaseDatabase.instance.ref('students').child(uid).child('student_id');
  //ref.once(value,function(snapshot{var name = snapshot.val().name;}))
  @override
  Widget build(BuildContext context) {
    String uid = user!.uid;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.person,
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
                    goToPageAndRemoveFromStack(
                        context, MyAppRouteConstants.homeRouteName);
                  },
                  icon: Icon(
                    Icons.home_filled,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    goToPageAndRemoveFromStack(
                        context, MyAppRouteConstants.settingsRouteName);
                  },
                  icon: Icon(
                    Icons.info,
                    size: 32,
                  ),
                ),
              ],
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
          child: FutureBuilder(
            future: Future.wait([getStudentName(), getStudentID()]),
            builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
              var name = snapshot.data?[0];
              var id = snapshot.data?[1];
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //app bar
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "My",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " Profile",
                                style: TextStyle(fontSize: 28),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50),

                    // FirebaseAnimatedList(
                    //   query: ref,
                    //   itemBuilder: (context, snapshot, animation, index) {
                    //     return ListTile(
                    //       title: Text(snapshot.child("name").value.toString()));
                    //   },
                    // ),
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      name.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 25),

                    Text(
                      'Institution',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'San Jose State University',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 25),

                    Text(
                      'Student ID',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      id.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 25),

                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0.00',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 130),

                    Consumer<LoginProvider>(
                      builder: (context, snapshot, _) {
                        return customButton(
                          context: context,
                          title: "Logout",
                          isActive: snapshot.isLoading,
                          onTap: () async {
                            snapshot.signOutUser(context);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    // Container(
                    //   child: TextButton(
                    //     onPressed: () async {
                    //       Navigator.of(context).pushReplacement(
                    //         MaterialPageRoute(builder: (context) => Newlogin()),
                    //       );
                    //     },
                    //     child: const Text(
                    //       "Logout",
                    //     ),
                    //     style: TextButton.styleFrom(
                    //       padding: const EdgeInsets.only(
                    //           top: 16.0, bottom: 16.0, left: 155, right: 155),
                    //       primary: Colors.white,
                    //       textStyle: const TextStyle(fontSize: 16),
                    //       backgroundColor: Colors.grey[800],
                    //     ),
                    //   ),
                    // )
                  ]);
            }),
          ),
        ),
      ),
    );
  }

  Future<Object?> getStudentName() async {
    DatabaseEvent event = await nameRef.once();
    Object? result = event.snapshot.value;
    return result;
  }

  Future<Object?> getStudentID() async {
    DatabaseEvent event = await idRef.once();
    Object? result = event.snapshot.value;
    return result;
  }
}
