import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Screens/Home/bookappointment.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/audiocall.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/mytopbar.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/profilecard.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/ratloc.dart';
import 'package:physiatrix/Widgets/SpecialistProfile/videocall.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class SpecialistProfile extends StatefulWidget {
  SpecialistProfile({Key? key,  required this.doctorData}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var doctorData;

  @override
  // ignore: library_private_types_in_public_api
  _SpecialistProfileState createState() => _SpecialistProfileState();
}

class _SpecialistProfileState extends State<SpecialistProfile> {
  String? selectedDoctorId;

  bool audioCallSelected = false;
  bool videoCallSelected = false;

  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                          const MyTopBar(text1: 'Specialist Profile'),
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
                          Padding(
                            padding: EdgeInsets.only(
                                top: 25.h, bottom: 5.h, left: 10.w),
                            child: Text(
                              'Working Time',
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
                              'Mon- Fri, 09.00 AM - 05.00PM',
                              style: TextStyle(
                                color: const Color(0xFF153144),
                                fontSize: 14.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    audioCallSelected = !audioCallSelected;
                                    videoCallSelected = false;
                                  });
                                },
                                child:
                                    AudioCall(isSelected: audioCallSelected)),
                          )),
                          Center(
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      videoCallSelected = !videoCallSelected;
                                      audioCallSelected = false;
                                    });
                                  },
                                  child: VideoCall(
                                      isSelected: videoCallSelected))),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: InkWell(
                              onTap: () {
                                if (audioCallSelected || videoCallSelected) {
                                  // Store data in Firestore
                                  
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                             BookAppointment(doctorProfile: widget.doctorData, appointmentType: audioCallSelected ? 'audio' : 'video'),
                                      ),
                                    );
                                  // firestore.collection('appointments').add({
                                  //   'doctorProfile': widget.doctorData,
                                  //   'appointmentType':
                                  //       audioCallSelected ? 'audio' : 'video',
                                  //   'userId': user?.uid,
                                  //   'timestamp': FieldValue.serverTimestamp(),
                                  // }).then((_) {
                                  // }).catchError((error) {
                                  //   print("Error adding appointment: $error");
                                  // });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Color(0xFFD3F36B),
                                      content: Text(
                                          'Please select an appointment type.'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                }
                              },  
                              child: const MainButton(text: 'Book Appointment'),
                            ),
                          )),
                          SizedBox(
                            height: 10.h,
                          )
                        ])))));
  }
}
