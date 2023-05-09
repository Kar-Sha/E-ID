// Select School
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:local_auth_ex/screens/get_started.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:device_info_plus/device_info_plus.dart';
//import 'package:local_auth_ex/main.dart';

class StudentID extends StatefulWidget {
  const StudentID({Key? key}) : super(key: key);

  @override
  State<StudentID> createState() => _StudentID();
}

class _StudentID extends State<StudentID> {
  final TextEditingController textEditingController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController student_id = TextEditingController();
  File? file;
  ImagePicker image = ImagePicker();
  var url;
  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('students');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.7),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                //back button
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Row(children: [
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => GetStarted()),
                        );
                      },
                      child: const Text(
                        "Back",
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ]),
                ),
              ),
              Center(
                child: Container(
                    height: 100,
                    width: 100,
                    child: file == null
                        ? IconButton(
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 70,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              getImage();
                            },
                          )
                        : MaterialButton(
                            height: 100,
                            child: Image.file(
                              file!,
                              fit: BoxFit.fill,
                            ),
                            onPressed: () {
                              getImage();
                            },
                          )),
              ),
              SizedBox(height: 120.0),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(children: [
                      Text("Enter Your School Information",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: name,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                            hintText: 'First Name and Last Name'),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                          controller: student_id,
                          decoration: InputDecoration(
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                            hintText: 'School ID',
                          ),
                          maxLength: 9,
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                      SizedBox(height: 30.0),
                      TextButton(
                        onPressed: () async {
                          if (file != null) {
                            uploadFile();
                          }                          /*
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                          */
                        },
                        child: const Text(
                          "Next",
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 138, right: 139),
                          textStyle: const TextStyle(fontSize: 16),
                          backgroundColor: Colors.grey[700],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });

    // print(file);
  }

  uploadFile() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("photo")
          .child("/${name.text}.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();
      String uniqueDeviceId = '';

  var deviceInfo = DeviceInfoPlugin();

  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    uniqueDeviceId = '${iosDeviceInfo.identifierForVendor}'; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    uniqueDeviceId = androidDeviceInfo.id ; // unique ID on Android
  }

      setState(() {
        url = url;
      });
      if (url != null) {
        Map<String, String> Student = {
          'name': name.text,
          'student_id': student_id.text,
          'url': url,
          'device_info': uniqueDeviceId,
        };

        dbRef!.push().set(Student).whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
