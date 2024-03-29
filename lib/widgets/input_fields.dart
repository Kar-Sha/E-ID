import 'package:local_auth_ex/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customInputField(
    {BuildContext? context,
    required String labelText,
    required String hintText,
    Widget? prefixIcon,
    required TextEditingController controller,
    bool? obscureText,
    String? Function(String?)? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: TextStyle(color: Colors.white, fontSize: 16)),
      SizedBox(height: 6.h),
      SizedBox(
        height: 56.h,
        width: 343.w,
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            hintStyle:
                CustomTextStyle.italic16.copyWith(color: Colors.grey[800]),
            hintText: hintText,
            prefixIcon: prefixIcon,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(width: 1, color: Colors.red.shade400)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(width: 1, color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(width: 1, color: Colors.white)),
          ),
        ),
      )
    ],
  );
}
