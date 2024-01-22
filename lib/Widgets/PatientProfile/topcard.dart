import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCard extends StatelessWidget {
  final File? imageFile;
  final String fullName;
  final String imageUrl;
  const TopCard({
    required this.imageFile,
    required this.fullName,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340.w,
        height: 170.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFD3F36B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 60.h,
              right: 115.w,
              left: 115.w,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: imageUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.fill,
                        )
                      : imageFile != null
                          ? DecorationImage(
                              image: FileImage(imageFile!),
                              fit: BoxFit.fill,
                            )
                          : const DecorationImage(
                              image: AssetImage('assets/images/cicular.png'),
                              fit: BoxFit.fill,
                            ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 115.h, left: 115.w),
              child: Text(
                fullName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontFamily: 'Red Hat Dispaly',
                  fontWeight: FontWeight.w600,
                  height: 1.27.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
