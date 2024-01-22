import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physiatrix/Screens/DietPlanner/screen3.dart';
import 'package:physiatrix/Widgets/DietPlan/linearprogressbar.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int selectedGender = -1;

  void selectGender(int index) {
    setState(() {
      selectedGender = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  titleSpacing: 0,
                  leading: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: const Color(0xFFD3F36B),
                        fontSize: 16.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  title: Text(
                    'Step 2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.30,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Screen3()),
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: const Color(0xFFD3F36B),
                          fontSize: 16.sp,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ],
                  centerTitle: true,
                ),
                const LinearBar1(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60.h, bottom: 20.h),
                    child: Text(
                      'What’s your Gender?',
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
                Center(
                  child: Text(
                    'Please answer the following questions to\npersonalize your plan and calculate your\ndaily calorie goal.',
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
                SizedBox(
                  height: 70.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => selectGender(0),
                    child: Container(
                      width: 100.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: selectedGender == 0
                            ? const Color(0xFFD3F36B)
                            : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
                            child: SvgPicture.asset('assets/images/male.svg'),
                          ),
                          Text(
                            'Male',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.30,
                              color: selectedGender == 0
                                  ? Colors.black
                                  : const Color(0xFF2F3530),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => selectGender(1),
                    child: Container(
                      width: 100.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: selectedGender == 1
                            ? const Color(0xFFD3F36B)
                            : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
                            child: SvgPicture.asset('assets/images/female.svg'),
                          ),
                          Text(
                            'Female',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.30,
                              color: selectedGender == 1
                                  ? Colors.black
                                  : const Color(0xFF2F3530),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
