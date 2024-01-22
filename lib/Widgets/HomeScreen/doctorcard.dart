import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Screens/Home/specialistprofile.dart';

// ignore: must_be_immutable
class DoctorCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;
  // ignore: prefer_typing_uninitialized_variables
  var doctorData;

  final Function(String)? onTap;

  DoctorCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.doctorData,
    this.onTap,
  }) : super(key: key);

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SpecialistProfile(doctorData: widget.doctorData,)),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 120,
              height: 130,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 20,
                    offset: Offset(0, -1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: CircleAvatar(
                      radius: 33.r,
                      backgroundImage: NetworkImage(widget.imageUrl),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$ ',
                          style: TextStyle(
                            color: const Color(0xFF0EBE7E),
                            fontSize: 9.sp,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.30,
                          ),
                        ),
                        TextSpan(
                          text: widget.price,
                          style: TextStyle(
                            color: const Color(0xFF677294),
                            fontSize: 9.sp,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
