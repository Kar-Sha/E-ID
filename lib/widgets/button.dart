import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton(
    {BuildContext? context,
    required void Function()? onTap,
    required String title,
    bool? isActive}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 345.w,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(16.r),
      ),
      // alignment: Alignment.center,
      child: isActive == true
          ? SizedBox(
              height: 16.h,
              width: 16.w,
              child: const CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : Text(
              title,
              style: TextStyle(fontSize: 16)
                  .copyWith(color: const Color(0xFFFFFFFF)),
            ),
    ),
  );
}
