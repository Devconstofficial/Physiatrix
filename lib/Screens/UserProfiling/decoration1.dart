import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Screens/UserProfiling/choose.dart';
import 'package:physiatrix/Screens/UserProfiling/decoration2.dart';

class DecorationScreen1 extends StatelessWidget {
  const DecorationScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: 375.w,
                height: 812.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 91.h),
                  child: Container(
                    width: 336.w,
                    height: 336.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/1.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 478.h, bottom: 12.h),
                  child: Text(
                    'Find Trusted Doctors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 28.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 523.h),
                  child: Text(
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xE5677294),
                      fontSize: 14.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w400,
                      height: 1.66.h,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 658.h),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DecorationScreen2()),
                      );
                    },
                    child: const MainButton(text: 'Next')),
              )),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 726.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseScreen()),
                      );
                    },
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF677294),
                        fontSize: 14.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w400,
                        height: 1.66.h,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ));
  }
}
