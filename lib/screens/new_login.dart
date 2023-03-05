import 'package:flutter/material.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/onboarding.dart';
import 'package:local_auth_ex/widgets/onboarding_list.dart';
import 'package:local_auth_ex/widgets/tower_id.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Newlogin extends StatefulWidget {
  const Newlogin({Key? key}) : super(key: key);

  @override
  State<Newlogin> createState() => _Newlogin();
}

class _Newlogin extends State<Newlogin> {
  @override
  Widget build(BuildContext context) => Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/images/background.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              height: 350,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Image.asset(
                    'lib/images/logo.png',
                    height: 100,
                  ),
                  Text("Get Started",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Onboarding()),
                            );
                          },
                          child: const Text(
                            "Set up Account",
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 16.0, left: 110, right: 110),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                            backgroundColor: Colors.grey[400],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Login with ID",
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 16.0, left: 120, right: 120),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                            backgroundColor: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ));
}
