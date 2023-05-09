//include log out, student info

// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/new_login.dart';
import 'package:local_auth_ex/screens/settings.dart';
import 'package:local_auth_ex/widgets/home_list.dart';
import 'package:local_auth_ex/widgets/tower_back.dart';
import 'package:local_auth_ex/widgets/tower_id.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final ref = FirebaseDatabase.instance.ref("students/-NUzjefy6wYLXN9y0FZD");
  //ref.once(value,function(snapshot{var name = snapshot.val().name;}))
  String name = '';
  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  icon: Icon(
                    Icons.home_filled,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
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
              name,
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
              '000000000',
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

            Container(
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Newlogin()),
                  );
                },
                child: const Text(
                  "Logout",
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 155, right: 155),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                  backgroundColor: Colors.grey[800],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
    void readName(String name) async {
      DatabaseEvent event = await ref.once();
      name = event.snapshot.child("name").value.toString();
  }
}