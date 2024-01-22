import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Screens/Appointments/audiocallscreen.dart';
import 'package:physiatrix/Screens/Appointments/writereview.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/mytopbar.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/profilecard.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/ratloc.dart';

// ignore: must_be_immutable
class DashBoard extends StatefulWidget {
  DashBoard({Key? key, this.doctorData, this.docData}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var doctorData;
  var docData;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String? selectedDoctorId;

  void handleDoctorCardTap(String doctorId) {
    setState(() {
      selectedDoctorId = doctorId;
    });
  }

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
                          const MyTopBar(text1: 'My Appointment'),
                          ProfileCard(
                            specialistData: widget.doctorData,
                          ),
                          const RatingLocation(),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.h, bottom: 5.h, left: 10.w),
                            child: Text(
                              'About Doctor',
                              style: TextStyle(
                                color: const Color(0xFF153144),
                                fontSize: 15.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              'Doctor Carla is the highest rated physiotherapist with an experience of more than 15 years in physiotherapy. She has helped thousands of patients to recover from suffering.',
                              style: TextStyle(
                                color: const Color(0xFF153144),
                                fontSize: 12.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CallPage(callID: "1")));
                                },
                                child:
                                    const MainButton(text: 'Start Voice Call')),
                          )),
                          SizedBox(
                            height: 40.h,
                          ),
                          Center(
                              child: InkWell(
                                  onTap: () {
                                    print(widget.docData);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WriteReview(
                                                docData: widget.docData,
                                              )),
                                    );
                                  },
                                  child: const MainButton(
                                      text: 'Write a review'))),
                          SizedBox(
                            height: 20.h,
                          ),
                        ])))));
  }
}
