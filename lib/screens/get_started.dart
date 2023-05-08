// Select School
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Text("Select Your School",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
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
                          style: TextStyle(fontSize: 20),
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
                ]),
              ),
            ),
          ]),
        ),
      ));
}
