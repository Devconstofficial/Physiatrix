import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentButtons extends StatefulWidget {
  const AppointmentButtons({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentButtonsState createState() => _AppointmentButtonsState();
}

class _AppointmentButtonsState extends State<AppointmentButtons> {
  bool _isUpcomingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  side: BorderSide(width: 1.w, color: const Color(0xFFD3F36B)),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    color: _isUpcomingSelected ? Colors.black : Colors.grey,
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
                  side: BorderSide(width: 1.w, color: const Color(0xFFD3F36B)),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  'Past',
                  style: TextStyle(
                    color: !_isUpcomingSelected ? Colors.black : Colors.grey,
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
    );
  }
}
