// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

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
          child: Column(
            children: [
              Container(
                width: 362,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
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
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(Icons.person)),
                    Text('SJSU',
                        style: TextStyle(fontSize: 30, color: Colors.blue[900]))
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
                      "NAME",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "STUDENT",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "*********",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
