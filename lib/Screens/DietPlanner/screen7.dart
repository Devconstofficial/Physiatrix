import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Screens/DietPlanner/screen8.dart';
import 'package:physiatrix/Widgets/DietPlan/linearprogressbar.dart';

class Screen7 extends StatefulWidget {
  const Screen7({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Screen7State createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  bool _isNetCarbsSelected = true;

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
                    'Step 7',
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
                          MaterialPageRoute(builder: (context) => Screen8()),
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
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: const LinearBar1(),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                    child: Text(
                      'Do you track carb or net carb?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Let us know if you would like to track carbs or net carbs, so that we can personalize plans according to your needs!',
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
                  height: 120.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isNetCarbsSelected = true;
                      });
                    },
                    child: Container(
                      width: 325.w,
                      height: 65.h,
                      decoration: ShapeDecoration(
                        color: _isNetCarbsSelected
                            ? const Color(0xFFD3F36B)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Net Carbs',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _isNetCarbsSelected
                                ? Colors.white
                                : const Color(0xFF2F3530),
                            fontSize: 18.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isNetCarbsSelected = false;
                      });
                    },
                    child: Container(
                      width: 325.w,
                      height: 65.h,
                      decoration: ShapeDecoration(
                        color: !_isNetCarbsSelected
                            ? const Color(0xFFD3F36B)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Total Carbs',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: !_isNetCarbsSelected
                                ? Colors.white
                                : const Color(0xFF2F3530),
                            fontSize: 18.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Screen7(),
  ));
}
