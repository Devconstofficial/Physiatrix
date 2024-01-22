import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/bartop.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BarTop(text: 'Privacy Policy'),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                            child: Text(
                              'Physio App Privacy Policy',
                              style: TextStyle(
                                color: const Color(0xFF677294),
                                fontSize: 18.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w400,
                              height: 1.55,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                            child: Text(
                              'Data Collection',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'The standard chunk of lorem Ipsum used since  1500s is reproduced below for those interested. \n\nSections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum. The point of using.\n\n Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.\n\nThe point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w400,
                              height: 1.56,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                            child: Text(
                              'Data Usage',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'It is a long established fact that reader distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w400,
                              height: 1.56,
                            ),
                            textAlign: TextAlign.justify,
                          )
                        ])))));
  }
}
