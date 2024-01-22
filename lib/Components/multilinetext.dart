import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MultiLineText extends StatefulWidget {
  final String label;
   MultiLineText({super.key, required this.label, this.textController, });

  TextEditingController? textController;

  @override
  State<MultiLineText> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MultiLineText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      cursorColor: Colors.black,
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
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      minLines: 4,
    );
  }
}
