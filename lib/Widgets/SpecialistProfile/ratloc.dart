import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RatingLocation extends StatelessWidget {
  const RatingLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/rating.svg',
                      height: 50.h,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '5.0\n',
                            style: TextStyle(
                              color: const Color(0xFF899CA8),
                              fontSize: 12.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Rating',
                            style: TextStyle(
                              color: const Color(0xFF899CA8),
                              fontSize: 12.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/location.svg',
                    height: 50.h,
                  ),
                ],
              ),
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hospital:\n',
                          style: TextStyle(
                            color: const Color(0xFF899CA8),
                            fontSize: 12.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'St. Lous Zamora Albacete',
                          style: TextStyle(
                            color: const Color(0xFF899CA8),
                            fontSize: 12.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
