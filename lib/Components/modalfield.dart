import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalField extends StatefulWidget {
  final String label;
  const ModalField({super.key, required this.label});

  @override
  State<ModalField> createState() => _ModalFieldState();
}

class _ModalFieldState extends State<ModalField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(0),
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
