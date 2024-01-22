import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(bool) onPressed;

  const ColorButton({super.key, 
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(!isSelected);
      },
      child: Container(
        width: 325.w,
        height: 65.h,
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFFD3F36B) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF2F3530),
              fontSize: 18.sp,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.30,
            ),
          ),
        ),
      ),
    );
  }
}
