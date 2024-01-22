import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  final String text;
  const LogoutButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.w,
      height: 54.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFE96F6F),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFF2F3530),
            fontSize: 18.sp,
            fontFamily: 'Red Hat Display',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.30,
          ),
        ),
      ),
    );
  }
}
