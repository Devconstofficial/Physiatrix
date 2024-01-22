import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 153,
      height: 56,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: SvgPicture.asset('assets/images/facebook.svg'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Facebook',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.30,
              ),
            ),
          )
        ],
      ),
    );
  }
}