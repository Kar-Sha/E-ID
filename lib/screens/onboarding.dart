import 'package:flutter/material.dart';
import 'package:local_auth_ex/screens/get_started.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/new_login.dart';
import 'package:local_auth_ex/widgets/onboarding_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _Onboarding();
}

class _Onboarding extends State<Onboarding> {
  final _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Newlogin()),
                      );
                    },
                    child: const Text(
                      "Back",
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                children: const [
                  OnboardingList(
                    icone: Icons.check_circle_outline,
                    description:
                        "Start by selecting your school and entering your student ID",
                  ),
                  OnboardingList(
                    icone: Icons.camera,
                    description: "Authenticate with facial recognition",
                  ),
                  OnboardingList(
                    icone: Icons.tag_faces_outlined,
                    description: "Your ID at a touch of a button",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              height: 80,
              alignment: Alignment.center,
              child: TextButton(
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GetStarted()),
                  );
                },
              ))
          : Container(
              color: Colors.grey[900],
              alignment: Alignment.center,
              height: 80,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(activeDotColor: Colors.grey.shade800),
                onDotClicked: (index) => _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
    );
  }
}
