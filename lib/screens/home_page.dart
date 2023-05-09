// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:local_auth_ex/screens/profile.dart';
import 'package:local_auth_ex/screens/settings.dart';
import 'package:local_auth_ex/widgets/home_list.dart';
import 'package:local_auth_ex/widgets/tower_back.dart';
import 'package:local_auth_ex/widgets/tower_id.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pagecontroller
  final _controller = PageController();
  final nameRef = FirebaseDatabase.instance.ref("students/-NUzjefy6wYLXN9y0FZD");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.home_filled,
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
                    readData();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  icon: Icon(
                    Icons.person,
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
        child: Column(children: [
          //app bar
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
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
                      " Cards",
                      style: TextStyle(fontSize: 28),
                    )
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add)),
              ],
            ),
          ),

          SizedBox(height: 25),

          //cards
          Container(
            height: 215,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: const [
                TowerCard(),
                TowerCardBack(),
              ],
            ),
          ),

          SizedBox(height: 25),

          SmoothPageIndicator(
            controller: _controller,
            count: 2,
            effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
          ),

          SizedBox(height: 10),

          //column -->stats + transactions
          HomeList(),
        ]),
      ),
    );
  }
      readData() async {
      DatabaseEvent event = await nameRef.once();
      print(event.snapshot.value);
  }
}