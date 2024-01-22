import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MainTextField extends StatefulWidget {
  final String label;
  MainTextField({
    super.key,
    required this.label,
    this.textController,
    required TextEditingController controller,
  });

  TextEditingController? textController;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.w, color: const Color(0xFFD3F36B)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: const Color(0xFFD3F36B)),
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
