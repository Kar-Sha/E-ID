import 'package:flutter/material.dart';
import 'package:local_auth_ex/screens/attendance.dart';
import 'package:local_auth_ex/screens/questions.dart';
import 'package:local_auth_ex/screens/view_history.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

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
                      child: Icon(Icons.check_box_outlined),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Attendance",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2),
                        Text("Check-in for exam attendance",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),

                IconButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Attendance()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
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

                IconButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => History()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
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
                        Text("Frequently Ask Questions",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2),
                        Text("Learn more about your student ID",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Questions()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
