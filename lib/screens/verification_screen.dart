import 'package:local_auth_ex/provider/authentication/registration_provider.dart';
import 'package:local_auth_ex/utils/routes.dart';
import 'package:local_auth_ex/utils/styles.dart';
import 'package:local_auth_ex/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            popPageFromStack(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.h),

            // the register text
            Text("Register",
                style:
                    CustomTextStyle.bold32.copyWith(color: Colors.grey[100])),
            SizedBox(height: 19.h),

            Text(
              "We have sent an email to your email\naccount with a verification link!",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            // continue button
            SizedBox(height: 58.h),
            Consumer<RegistrationProvider>(
              builder: (context, snapshot, _) {
                return customButton(
                  title: "Continue to Login",
                  onTap: () async {
                    snapshot.checkEmailVerificationStatus(context);
                  },
                  context: context,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
