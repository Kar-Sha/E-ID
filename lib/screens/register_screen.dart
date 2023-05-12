import 'package:local_auth_ex/provider/authentication/registration_provider.dart';
import 'package:local_auth_ex/utils/router/app_route_constants.dart';
import 'package:local_auth_ex/utils/routes.dart';
import 'package:local_auth_ex/utils/snackbar.dart';
import 'package:local_auth_ex/utils/styles.dart';
import 'package:local_auth_ex/widgets/button.dart';
import 'package:local_auth_ex/widgets/input_fields.dart';
import 'package:local_auth_ex/widgets/textspans_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        leading: InkWell(
          onTap: () {
            goToNextPageAndBack(context, MyAppRouteConstants.loginRouteName);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Form(
          key: formKey,
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

              // the register text
              Text("Register",
                  style:
                      CustomTextStyle.bold32.copyWith(color: Colors.grey[100])),
              SizedBox(height: 19.h),
              RichText(
                text: TextSpan(
                  text: "Create an",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  children: [
                    TextSpan(
                      text: " account",
                      style: CustomTextStyle.regularBold16
                          .copyWith(color: Colors.grey[100]),
                    ),
                    TextSpan(
                      text: " access all the \nfeatures of",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextSpan(
                      text: " E-ID!",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),

              // the textfields
              SizedBox(height: 40.h),
              customInputField(
                context: context,
                labelText: "Email",
                hintText: "Ex: abc@example.com",
                prefixIcon: SizedBox(
                  height: 19.18.h,
                  width: 19.2.w,
                  child: Image.asset(
                    "assets/images/at.png",
                    color: Colors.blue[900],
                  ),
                ),
                controller: emailController,
                validator: (value) {
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!) &&
                      value.isEmpty) {
                    showSnackBar(context, "empty email field or email invalid",
                        Colors.redAccent);
                  }
                  return null;
                },
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
                obscureText: true,
              ),

              // register button
              SizedBox(height: 60.h),
              Consumer<RegistrationProvider>(
                builder: (context, provider, child) {
                  return customButton(
                    context: context,
                    title: "Register",
                    isActive: provider.isLoading,
                    onTap: () async {
                      var email = emailController.text.trim();
                      var password = passwordController.text.trim();
                      if (formKey.currentState!.validate()) {
                        provider
                            .registerUser(
                          email: email,
                          password: password,
                          context: context,
                        )
                            .then(
                          (value) {
                            emailController.clear();
                            passwordController.clear();
                          },
                        );
                      }
                    },
                  );
                },
              ),

              // the text span
              SizedBox(height: 40.h),
              textSpanWidget(
                context: context,
                firstTitle: "Already have an account? ",
                secondTitle: "Login",
                onTap: () {
                  popPageFromStack(context);
                },
              )
              // the text spans.
            ],
          ),
        ),
      ),
    );
  }
}