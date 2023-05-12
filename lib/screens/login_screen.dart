import 'package:local_auth_ex/provider/authentication/login_provider.dart';
import 'package:local_auth_ex/provider/authentication/registration_provider.dart';
import 'package:local_auth_ex/utils/router/app_route_constants.dart';
import 'package:local_auth_ex/utils/routes.dart';
import 'package:local_auth_ex/utils/styles.dart';
import 'package:local_auth_ex/widgets/button.dart';
import 'package:local_auth_ex/widgets/continue_with_google.dart';
import 'package:local_auth_ex/widgets/input_fields.dart';
import 'package:local_auth_ex/widgets/textspans_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        leading: InkWell(
          onTap: () {
            popPageFromStack(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'lib/images/logo.png',
                  height: 80,
                ),
              ],
            ),

            // the login text
            Text("Login",
                style:
                    CustomTextStyle.bold32.copyWith(color: Colors.grey[100])),
            SizedBox(height: 19.h),
            Text("Login with your school email and password",
                style: TextStyle(color: Colors.white, fontSize: 16)),

            // the textfields
            SizedBox(height: 40.h),
            customInputField(
              context: context,
              labelText: "Email",
              hintText: "email@example.com",
              prefixIcon: SizedBox(
                height: 19.18.h,
                width: 19.2.w,
                child: Image.asset(
                  "assets/images/at.png",
                  color: Colors.blue[900],
                ),
              ),
              controller: emailController,
            ),
            SizedBox(height: 28.h),
            customInputField(
                context: context,
                labelText: "Your Password",
                hintText: "********",
                prefixIcon: SizedBox(
                  height: 19.h,
                  width: 16.9.w,
                  child: Image.asset("assets/icons/lock.png",
                      color: Colors.blue[900]),
                ),
                controller: passwordController,
                obscureText: true),

            // forgot password
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                goToNextPageAndBack(
                    context, MyAppRouteConstants.resetRouteName);
              },
              child: Text(
                "Forgot Password?",
                style: CustomTextStyle.regular16.copyWith(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),

            // login button
            SizedBox(height: 28.h),
            Consumer<LoginProvider>(builder: (context, logProvider, _) {
              return customButton(
                isActive: logProvider.isLoading,
                context: context,
                title: "Login",
                onTap: () async {
                  var email = emailController.text.trim();
                  var password = passwordController.text.trim();
                  logProvider
                      .loginUser(
                          email: email, password: password, context: context)
                      .then(
                    (value) {
                      emailController.clear();
                      passwordController.clear();
                    },
                  );
                },
              );
            }),

            //the divider
            SizedBox(height: 28.h),
            const Divider(
              height: 1,
              color: Colors.white,
            ),

            //continue with google button
            SizedBox(height: 28.h),
            Consumer<RegistrationProvider>(
              builder: (context, snapshot, _) {
                return continueWithGoogle(
                  context: context,
                  onTap: () async {
                    snapshot.signInWithGoogleStatus(context);
                  },
                );
              },
            ),

            // the text span
            SizedBox(height: 40.h),
            textSpanWidget(
              context: context,
              firstTitle: "Don't have an account? ",
              secondTitle: "Register",
              onTap: () {
                goToNextPageAndBack(
                    context, MyAppRouteConstants.registerRouteName);
              },
            )
            // the text spans.
          ],
        ),
      ),
    );
  }
}
