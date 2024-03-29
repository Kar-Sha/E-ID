import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_auth_ex/utils/styles.dart';

Row textSpanWidget(
    {BuildContext? context,
    required String firstTitle,
    required String secondTitle,
    required void Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RichText(
        text: TextSpan(
          text: firstTitle,
          style: CustomTextStyle.regular16.copyWith(color: Colors.white),
          children: [
            TextSpan(
              text: secondTitle,
              style:
                  CustomTextStyle.regularBold16.copyWith(color: Colors.white),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            )
          ],
        ),
      ),
    ],
  );
}
