import 'package:local_auth_ex/helpers/shared_pref.dart';
import 'package:local_auth_ex/services/authentication_services.dart';
import 'package:local_auth_ex/utils/router/app_route_constants.dart';
import 'package:local_auth_ex/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false; //handles the circularProgressBar

  bool get isLoading => _isLoading;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // handles the login of users
  Future loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    await AuthenticationMethods(_auth)
        .loginUserWithEmail(context: context, email: email, password: password)
        .then(
      (value) {
        _isLoading = false;
        notifyListeners();
        SharedPrefHelperFunction.saveLoggedInState(true);
      },
    );
  }

  Future signOutUser(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    await AuthenticationMethods(_auth).signOut(context).then(
      (value) {
        _isLoading = false;
        notifyListeners();
        SharedPrefHelperFunction.saveLoggedInState(false);
        goToPageAndRemoveFromStack(context, MyAppRouteConstants.newLoginRouteName);
      },
    );
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  }

  Future resetPassword(BuildContext context, String email) async {
    _isLoading = true;
    notifyListeners();
    await AuthenticationMethods(_auth)
        .resetPassword(context, email)
        .then((value) {
      _isLoading = false;
      notifyListeners();
    });
  }
}
