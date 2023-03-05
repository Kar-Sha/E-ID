import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //icon
                Row(
                  children: [
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.info_outline),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("View ID Information",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2),
                        Text("See your balance",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),

                Icon(Icons.arrow_forward_ios),
              ],
            ),
            Container(
              width: 350,
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //icon
                Row(
                  children: [
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.history),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("View History",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2),
                        Text("See when and where you scanned",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),

                Icon(Icons.arrow_forward_ios),
              ],
            ),
            Container(
              width: 350,
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //icon
                Row(
                  children: [
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.credit_card),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Request New Physical Copy",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2),
                        Text("Visit the SJSU website to schedule",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),

                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ],
        ),
      ),
    );
  }
}