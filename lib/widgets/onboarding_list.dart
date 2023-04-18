import 'package:flutter/material.dart';

class OnboardingList extends StatelessWidget {
  final String description;
  final IconData icone;
  const OnboardingList({
    Key? key,
    required this.icone,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130.0, bottom: 50.0),
              child: Icon(
                icone,
                size: 130,
                color: Colors.grey[400],
              ),
            ),
            Text(
              description,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
