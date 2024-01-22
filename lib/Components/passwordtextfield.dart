import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hidePass,
      controller: widget.controller,
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
        suffixIcon: IconButton(
          icon: hidePass
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.panorama_fish_eye_outlined),
          onPressed: () {
            setState(() {
              hidePass = !hidePass;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        hintText: 'Password',
        hintStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Red Hat Display',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
