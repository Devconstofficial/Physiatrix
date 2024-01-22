import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoCall extends StatelessWidget {
  final bool isSelected;
  const VideoCall({Key? key, this.isSelected = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295.w,
      height: 54.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  color: isSelected ? Colors.white : const Color(0xFFD3F36B),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 10.w),
                        child: Row(
                          children: [
                            Text(
                              'Video Call',
                              style: TextStyle(
                                color: const Color(0xFF153144),
                                fontSize: 16.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            Text(
                              '\$10',
                              style: TextStyle(
                                color: const Color(0xFF153144),
                                fontSize: 16.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 5.h),
                            child: Text(
                              'Discuss everything on vedio call.',
                              style: TextStyle(
                                color: const Color(0xFF153144),
                                fontSize: 12.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              child: Container(
                width: 70.w,
                height: 54.h,
                color: isSelected ? const Color(0xFFD3F36B) : Colors.white,
                child: Center(
                  child: Image.asset(
                    'assets/images/Video.png',
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
