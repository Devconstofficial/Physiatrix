import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondModalSheet extends StatelessWidget {
  const SecondModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 375.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Center(
        child: Text(
          'This is the second bottom modal sheet',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }
}
