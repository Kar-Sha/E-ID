// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';

final User? user = FirebaseAuth.instance.currentUser;
final String uid = user!.uid;
final DatabaseReference nameRef =
    FirebaseDatabase.instance.ref('students').child(uid).child('name');
final DatabaseReference idRef =
    FirebaseDatabase.instance.ref('students').child(uid).child('student_id');
final DatabaseReference imageRef =
    FirebaseDatabase.instance.ref('students').child(uid).child('url');

class TowerCard extends StatelessWidget {
  const TowerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(16)),
          child: FutureBuilder(
            future: Future.wait([getStudentName(), getStudentID(), getImage()]),
            builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
              var name = snapshot.data?[0];
              var id = snapshot.data?[1];
              var images = snapshot.data?[2];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 362,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Tower Card',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 17, left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageUrl: images.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              width: 63,
                              height: 77,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 25),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) => Icon(Icons.person),
                            errorWidget: (context, url, error) => Icon(Icons.person),
                          ),
                          Flexible(
                              child: Text('SJSU',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue[900]))),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, bottom: 17),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              //"NAME",
                              name.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              "STUDENT",
                              //image.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              id.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ))
                  ],
                ),
              );
            }),
          )),
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

  Future<Object?> getImage() async {
    DatabaseEvent event = await imageRef.once();
    Object? result = event.snapshot.value;
    return result;
  }
}
