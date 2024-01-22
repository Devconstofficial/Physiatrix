import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton1 extends StatelessWidget {
  final String text;
  final Future<void> Function() onPressed; 

  const MainButton1({
    Key? key,
    required this.text,
     required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       
        await onPressed();
      },
      child: Container(
        width: 295.w,
        height: 54.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFD3F36B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
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
      ),
    );
  }
}
