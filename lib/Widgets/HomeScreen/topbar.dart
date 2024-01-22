import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(211, 243, 107, 1),
              radius: 20,
              child: SvgPicture.asset(
                'assets/images/profile.svg',
                height: 30.h,
                width: 30.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: Text(
                'Physiatrix',
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
      ],
    );
  }
}
