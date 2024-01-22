import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Screens/DietPlanner/screen1.dart';
import 'package:physiatrix/Widgets/HomeScreen/topbar.dart';
import 'package:physiatrix/Widgets/HomeScreen/doctorcard.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            body: Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeTopBar(),
                      Padding(
                        padding: EdgeInsets.only(top: 50.h, bottom: 15.h),
                        child: Text(
                          'Featured Doctors',
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 18.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 140.h,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('doctors')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (!snapshot.hasData) {
                              return const Text('No data available');
                            } else {
                              final doctorCards =
                                  snapshot.data!.docs.map((doctor) {
                                final data =
                                    doctor.data() as Map<String, dynamic>;
                                return DoctorCard(
                                  imageUrl: data['image_url'],
                                  name: data['name'],
                                  price: data['price'],
                                  doctorData: data,


                                );
                              }).toList();

                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: doctorCards,
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Text(
                          'More Features',
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 18.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen1()),
                              );
                            },
                            child: Container(
                              width: 150.w,
                              height: 223.h,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/DP.png'),
                                ),
                                color: const Color(0xFFD3F36B),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: Text(
                                      'Diet Planner',
                                      style: TextStyle(
                                        color: const Color(0xFF333333),
                                        fontSize: 18.sp,
                                        fontFamily: 'Red Hat Display',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Container(
                                  width: 191.w,
                                  height: 168.h,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/PA.png'),
                                    ),
                                    color:
                                        const Color.fromRGBO(107, 202, 243, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.h),
                                        child: Text(
                                          'Physio Analyzer',
                                          style: TextStyle(
                                            color: const Color(0xFF333333),
                                            fontSize: 18.sp,
                                            fontFamily: 'Red Hat Display',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.h, left: 10.w),
                                child: Container(
                                  width: 191.w,
                                  height: 168.h,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/VA.png'),
                                    ),
                                    color:
                                        const Color.fromRGBO(243, 197, 107, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.h),
                                        child: Text(
                                          'VR Analyzer',
                                          style: TextStyle(
                                            color: const Color(0xFF333333),
                                            fontSize: 18.sp,
                                            fontFamily: 'Red Hat Display',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
            )));
  }
}
