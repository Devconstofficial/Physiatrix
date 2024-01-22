import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AuthTextField extends StatefulWidget {
  final String label;
  AuthTextField(
      {super.key,
      required this.label,
      required this.controller});

  TextEditingController? controller;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: widget.controller,
      style: const TextStyle(color: Colors.black),
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
    );
  }
}
