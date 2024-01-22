import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:physiatrix/Widgets/MyAppoitments/appointmentcard.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key});

  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  bool _isUpcomingSelected = true;

  List<Map<String, dynamic>> filterAppointments(
      List<Map<String, dynamic>> appointments, bool isUpcoming) {
    final currentDate = DateTime.now();
    return appointments.where((appointment) {
      final Timestamp timestamp = appointment['selectedDate'];
      final DateTime dateTime = timestamp.toDate();
      return isUpcoming
          ? dateTime.isAfter(currentDate)
          : dateTime.isBefore(currentDate);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        padding: EdgeInsets.only(left: 23.w),
                        child: Text(
                          'My Appointments',
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
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 20.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isUpcomingSelected = true;
                        });
                      },
                      child: Container(
                        width: 129.w,
                        height: 37.h,
                        decoration: ShapeDecoration(
                          color: _isUpcomingSelected
                              ? const Color(0xFFD3F36B)
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: const Color(0xFFD3F36B)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: _isUpcomingSelected
                                  ? Colors.black
                                  : Colors.grey,
                              fontSize: 14.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isUpcomingSelected = false;
                        });
                      },
                      child: Container(
                        width: 129.w,
                        height: 37.h,
                        decoration: ShapeDecoration(
                          color: !_isUpcomingSelected
                              ? const Color(0xFFD3F36B)
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: const Color(0xFFD3F36B)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Past',
                            style: TextStyle(
                              color: !_isUpcomingSelected
                                  ? Colors.black
                                  : Colors.grey,
                              fontSize: 14.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('appointments')
                      .orderBy('selectedDate', descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text('No appointments found.');
                    }

                    final appointmentDocuments = snapshot.data!.docs;

                    final Map<String, List<Map<String, dynamic>>>
                        groupedAppointments = {};

                    for (final document in appointmentDocuments) {
                      final data = document.data() as Map<String, dynamic>;

                      final Timestamp timestamp = data['selectedDate'];
                      final DateTime dateTime = timestamp.toDate();
                      final String formattedDate =
                          DateFormat.yMMMd().format(dateTime);

                      if (!groupedAppointments.containsKey(formattedDate)) {
                        groupedAppointments[formattedDate] = [];
                      }

                      groupedAppointments[formattedDate]!.add(data);
                    }

                    final List<Map<String, dynamic>> filteredAppointments =
                        _isUpcomingSelected
                            ? filterAppointments(
                                appointmentDocuments
                                    .map((document) =>
                                        document.data() as Map<String, dynamic>)
                                    .toList(),
                                true,
                              )
                            : filterAppointments(
                                appointmentDocuments
                                    .map((document) =>
                                        document.data() as Map<String, dynamic>)
                                    .toList(),
                                false,
                              );

                    return ListView(
                      children: filteredAppointments.map((data) {
                        final String doctorName = data['doctorProfile']['name'];
                        final String callType = data['appointmentType'];
                        final String selectedTime = data['selectedTime'];

                        final String doctorImage =
                            data['doctorProfile']['image_url'].toString();
                        final Timestamp timestamp = data['selectedDate'];
                        final DateTime dateTime = timestamp.toDate();
                        final String formattedDate =
                            DateFormat.yMMMd().format(dateTime);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
                              child: Center(
                                child: Text(
                                  formattedDate,
                                  style: TextStyle(
                                    color: const Color(0xFF153144),
                                    fontSize: 14.sp,
                                    fontFamily: 'Red Hat Display',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            AppointmentCard1(
                              doctorName: doctorName,
                              selectedTime: selectedTime,
                              callType: callType,
                              appointmentDate: dateTime,
                              doctorData: data['doctorProfile'],
                              docData : data,
                              imageUrl: doctorImage,
                            ),
                          ],
                        );
                      }).toList(),
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
