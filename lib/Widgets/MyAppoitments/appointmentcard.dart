import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:physiatrix/Screens/Appointments/dashboard.dart';
import 'package:physiatrix/Screens/Appointments/dashboard2.dart';

class AppointmentCard1 extends StatelessWidget {
  final String doctorName;
  final String callType;
  final DateTime appointmentDate;
  final String selectedTime;
  final String imageUrl;

  // ignore: prefer_typing_uninitialized_variables
  final doctorData;
  final docData;

  AppointmentCard1({
    required this.doctorName,
    required this.callType,
    required this.appointmentDate,
    required this.doctorData,
    required this.selectedTime,
    required this.docData,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  void navigateToScreen(BuildContext context) {
    if (callType == 'audio') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(
            doctorData: doctorData,
            docData: docData,
          ),
        ),
      );
    } else if (callType == 'video') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard2(
            docData: docData,
            doctorData: doctorData,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPastAppointment = appointmentDate.isBefore(DateTime.now());

    return InkWell(
      onTap: () {
        navigateToScreen(context);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Container(
          width: 340,
          height: 105,
          decoration: ShapeDecoration(
            color: const Color(0xFF24282C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Container(
                  width: 130,
                  height: 110,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130, top: 10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: const TextStyle(
                          color: Color(0xFFD3F36B),
                          fontSize: 16,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '$callType call - ',
                                style: const TextStyle(
                                  color: Color(0xFFCDDFEB),
                                  fontSize: 12,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: isPastAppointment
                                    ? 'Completed'
                                    : 'Upcoming',
                                style: const TextStyle(
                                  color: Color(0xFFD3F36B),
                                  fontSize: 10,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        selectedTime,
                        style: const TextStyle(
                          color: Color(0xFF899CA8),
                          fontSize: 8,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: SvgPicture.asset(
                  callType == 'Voice'
                      ? 'assets/images/call.svg'
                      : 'assets/images/video.svg',
                  key: ValueKey<String>(callType),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
