import 'package:local_auth_ex/screens/attendance.dart';
import 'package:local_auth_ex/screens/get_started.dart';
import 'package:local_auth_ex/screens/home_page.dart';
import 'package:local_auth_ex/screens/login_screen.dart';
import 'package:local_auth_ex/screens/new_login.dart';
import 'package:local_auth_ex/screens/onboarding.dart';
import 'package:local_auth_ex/screens/profile.dart';
import 'package:local_auth_ex/screens/questions.dart';
import 'package:local_auth_ex/screens/register_screen.dart';
import 'package:local_auth_ex/screens/reset_password_screen.dart';
import 'package:local_auth_ex/screens/settings.dart';
import 'package:local_auth_ex/screens/splash_screen.dart';
import 'package:local_auth_ex/screens/student_id.dart';
import 'package:local_auth_ex/screens/verification_screen.dart';
import 'package:local_auth_ex/screens/view_history.dart';
import 'package:local_auth_ex/screens/welcome_screen.dart';
import 'package:local_auth_ex/utils/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.splashRouteName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.welcomeRouteName,
        path: '/#',
        pageBuilder: (context, state) {
          return const MaterialPage(child: WelcomeScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loginRouteName,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.newLoginRouteName,
        path: '/newLogin',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Newlogin());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.registerRouteName,
        path: '/register',
        pageBuilder: (context, state) {
          return const MaterialPage(child: RegisterScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.verificationRouteName,
        path: '/user/verify-email',
        pageBuilder: (context, state) {
          return const MaterialPage(child: VerificationScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.resetRouteName,
        path: '/user/reset-password',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ResetPasswordScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.homeRouteName,
        path: '/user/home',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
    GoRoute(
        name: MyAppRouteConstants.profileRouteName,
        path: '/user/profile',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Profile());
        },
      ),
    GoRoute(
        name: MyAppRouteConstants.settingsRouteName,
        path: '/user/settings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Settings());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.onboardingRouteName,
        path: '/user/onboarding',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Onboarding());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.questionsRouteName,
        path: '/user/questions',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Questions());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.studentIDRouteName,
        path: '/user/student-id',
        pageBuilder: (context, state) {
          return const MaterialPage(child: StudentID());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.viewHistoryRouteName,
        path: '/user/view-histoey',
        pageBuilder: (context, state) {
          return const MaterialPage(child: History());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.getStartedRouteName,
        path: '/user/get-started',
        pageBuilder: (context, state) {
          return const MaterialPage(child: GetStarted());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.attendanceRouteName,
        path: '/user/attendance',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Attendance());
        },
      ),
    ],
  );
}
