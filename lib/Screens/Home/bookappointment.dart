import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physiatrix/Components/datepicker.dart';

// ignore: must_be_immutable
class BookAppointment extends StatelessWidget {
  BookAppointment({super.key, this.doctorProfile, this.appointmentType});

  // ignore: prefer_typing_uninitialized_variables
  var doctorProfile;
  String? appointmentType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(children: [
                      Row(
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
                              'Book Appoitment',
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
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: MyDatePicker(doctorProfile: doctorProfile, appointmentType: appointmentType,),
                      )
                    ])))));
  }
}
