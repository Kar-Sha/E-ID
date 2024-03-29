import 'package:flutter/material.dart';

import '../utils/router/app_route_constants.dart';
import '../utils/routes.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  String dropdownValue = 'Select School';

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  TextButton(
                    onPressed: () async {
                      goToPageAndRemoveFromStack(context, MyAppRouteConstants.onboardingRouteName);
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
            SizedBox(height: 150.0),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(27.0),
                child: Column(children: [
                  Text("Select Your School",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  SizedBox(height: 30.0),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Select School",
                        fillColor: Colors.white),
                    value: dropdownValue,
                    // Step 4.
                    items: <String>[
                      'Select School',
                      'San Jose State University',
                      'Other'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  TextButton(
                    onPressed: () async {
                      goToPageAndRemoveFromStack(context, MyAppRouteConstants.registerRouteName);
                    },
                    child: const Text(
                      "Next",
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 150, right: 150),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                      backgroundColor: Colors.grey[700],
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ));
}