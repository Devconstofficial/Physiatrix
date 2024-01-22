import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietText extends StatefulWidget {
  final String label;
  const DietText({super.key, required this.label});

  @override
  State<DietText> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<DietText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: TextField(
        keyboardType: TextInputType.phone,
        cursorColor: const Color(0xFFD3F36B), // Set cursor color
        style: TextStyle(
          color: const Color(0xFFD3F36B),
          fontSize: 60.sp,
        ), // Set text color
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 2, color: Colors.transparent), // White border color
            borderRadius: BorderRadius.circular(12.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Colors.transparent), // White border color
            borderRadius: BorderRadius.circular(12.r),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent), // White border color
            borderRadius: BorderRadius.circular(12.r),
          ),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: const Color(0xFFD3F36B), // White hint text color
            fontSize: 48.sp,
            fontFamily: 'Red Hat Display',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
