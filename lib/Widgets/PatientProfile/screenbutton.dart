import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenButton extends StatelessWidget {
  final String svgAsset;
  final String buttonText;

  const ScreenButton({
    Key? key,
    required this.svgAsset,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340.w,
        height: 45.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFD3F36B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SvgPicture.asset(
                svgAsset,
                width: 25.w,
                height: 25.h,
              ),
            ),
            Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w700,
                height: 1.43,
                letterSpacing: 0.25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
