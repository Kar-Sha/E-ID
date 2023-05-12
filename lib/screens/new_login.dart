import 'package:flutter/material.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';

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
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            goToPageAndRemoveFromStack(context,
                                MyAppRouteConstants.onboardingRouteName);
                          },
                          child: const Text(
                            "Set up Account",
                          ),
                          style: TextButton.styleFrom(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                            backgroundColor: Colors.grey[400],
                            fixedSize: Size(300, 50),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () async {
                            goToPageAndRemoveFromStack(
                                context, MyAppRouteConstants.loginRouteName);
                          },
                          child: const Text(
                            "Login",
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 16.0, left: 120, right: 120),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 16),
                            backgroundColor: Colors.grey[700],
                            fixedSize: Size(300, 50),
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
