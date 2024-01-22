import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SmallTextField extends StatefulWidget {
  final String label;
  SmallTextField(
      {super.key,
      required this.label,
      required TextEditingController controller});

  TextEditingController? controller;

  @override
  State<SmallTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<SmallTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125.w,
      child: TextField(
        controller: widget.controller,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xFFD3F36B)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFD3F36B)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Red Hat Display',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
