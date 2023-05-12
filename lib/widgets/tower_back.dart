// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

final User? user = FirebaseAuth.instance.currentUser;
final String userid = user!.uid;

class TowerCardBack extends StatelessWidget {
  const TowerCardBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                width: 362,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "To report lost or stolen card, contact the San Jose State University Bursar’s office: One Washingtion Square, San Jose, CA 995192 | 408-924-1601 | sjsu.edu/bursar",
                        style: TextStyle(fontSize: 8),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "National Suicide Prevention Lifeline: 1-800-273-8255",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Crisis Text Line: text HOME to 741741",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "University Police Department: 408-924-2222",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        shadowColor: Colors.amber,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: BarcodeWidget(
                            barcode: Barcode.code128(),
                            data: userid,
                            width: 200,
                            height: 30,
                            drawText: false,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
