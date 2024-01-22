import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProfileCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var specialistData;

  ProfileCard({Key? key, this.specialistData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, left: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 131.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(specialistData['image_url']),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      specialistData['name'],
                      style: TextStyle(
                        color: const Color(0xFF153144),
                        fontSize: 16.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                      child: Text(
                        specialistData['designation'],
                        style: TextStyle(
                          color: const Color(0xFFCDDFEB),
                          fontSize: 12.sp,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Every day I help my patients with \nphysicalproblems caused by injury, \nillness or trauma to recover your physical \nwell-being.',
                      style: TextStyle(
                        color: const Color(0xFF899CA8),
                        fontSize: 8.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
