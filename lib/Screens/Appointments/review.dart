import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/arrow.svg',
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100.w),
                    child: Text(
                      'Reviews',
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
              Center(
                child: Text(
                  '4.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 70.sp,
                    fontFamily: 'Red Hat Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    itemSize: 30.sp,
                    initialRating: 4,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xFFD3F36B),
                    ),
                    onRatingUpdate: (rating) {},
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  'Based on 24 reviews',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 390.w,
                height: 2.h,
                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
              ),
              // Wrapping the review section in ListView.builder
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10, // Assuming you want to display one review.
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Container(
                        width: 390.w,
                        height: 170.h,
                        decoration: ShapeDecoration(
                          color: const Color(0x9ED3F36B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: ShapeDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/123.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(60.r),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Text(
                                          'Jennifer',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 15.sp,
                                            initialRating: 4,
                                            minRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Color(0xFFD3F36B),
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            '5.0',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Doctor Carla is the highest rated physiotherapist\nwith an experience of 15 years in physiotherapy.She\nhas helped thousands of patients to recover from\nsuffering.',
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
