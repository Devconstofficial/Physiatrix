import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.sender});

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(sender).text.subtitle1(context).make().box.alignCenter.makeCentered(), 
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sender, style: TextStyle(
              color: const Color(0xFF2F3530),
            fontSize: 18.sp,
            fontFamily: 'Red Hat Display',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.30,
            ),),
            Container(
              margin: EdgeInsets.only(top: 5.h),
              child: Text(text),
            )
          ],
        ))
      ],
    );
  }
}
