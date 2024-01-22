import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/diettext.dart';
import 'package:physiatrix/Screens/DietPlanner/screen7.dart';
import 'package:physiatrix/Widgets/DietPlan/linearprogressbar.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Screen6State createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
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
                    'Step 6',
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
                          MaterialPageRoute(builder: (context) => Screen7()),
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
                      'What’s your Age?',
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
                    'Please answer the following question to\npersonalize your plan and calculate your daily goal.',
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
                Padding(
                  padding: EdgeInsets.only(top: 150.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const DietText(label: ''),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text(
                          ' years',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                    ],
                  ),
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
    home: Screen6(),
  ));
}
