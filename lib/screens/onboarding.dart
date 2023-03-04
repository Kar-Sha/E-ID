import 'package:flutter/material.dart';
import 'package:local_auth_ex/widgets/onboarding_list.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _Onboarding();
}

class _Onboarding extends State<Onboarding> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
            Container(
              height: 600,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: const [
                  OnboardingList(
                    icone: Icons.check_circle_outline,
                    description:
                        "Start by selecting your school and entering your student ID",
                  ),
                  OnboardingList(
                    icone: Icons.check_circle_outline,
                    description:
                        "Start by selecting your school and entering your student ID",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
