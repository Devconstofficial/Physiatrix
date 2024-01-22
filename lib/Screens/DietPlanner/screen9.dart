import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Screens/DietPlanner/screen10.dart';

class Screen9 extends StatelessWidget {
  const Screen9({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          Center(
                            child: Text(
                              Emojis.wavingHandLightSkinTone,
                              style: TextStyle(
                                fontSize: 150.sp,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Text(
                                'Welcome to a \nHealthier life.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 120.h),
                            child: Center(
                              child: Text(
                                'You can start immediately\nEnjoy healthier life\nfrom today.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ),
                          ),
                          Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Screen10()),
                                    );
                                  },
                                  child: const MainButton(text: 'Continue')))
                        ])))));
  }
}
