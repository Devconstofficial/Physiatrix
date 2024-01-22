import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyTopBar extends StatelessWidget {
  final String text1;
  const MyTopBar({super.key, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/images/arrow.svg',
                height: 20.h,
                width: 20.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: Text(
                text1,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 24.sp,
                  fontFamily: 'Red Hat Display',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/heart.svg',
              height: 30.h,
              width: 30.w,
            ),
          ],
        )
      ],
    );
  }
}
