import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Screens/UserProfiling/login.dart';

class ChooseScreen extends StatelessWidget {
   const ChooseScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 54.h, bottom: 23.h),
                      child: Container(
                        width: 232.w,
                        height: 199.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Logo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Continue as:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF2F3530),
                        fontSize: 32.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login(role: 'patient'),)
                          );
                        },
                        child: Container(
                          width: 300.w,
                          height: 159.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD3F36B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/image 1.png'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Patient',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF2F3530),
                                      fontSize: 32.sp,
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                 builder: (context) => const Login(role: 'doctor'), 
                        ),
                          );
                        },
                        child: Container(
                          width: 300.w,
                          height: 159.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD3F36B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/image 2.png'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Doctor',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF2F3530),
                                      fontSize: 32.sp,
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ]))));
  }
}
