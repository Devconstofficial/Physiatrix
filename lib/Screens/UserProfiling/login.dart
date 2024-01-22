import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:physiatrix/Components/authtextfield.dart';
import 'package:physiatrix/Components/facebookbutton.dart';
import 'package:physiatrix/Components/googlebutton.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Components/passwordtextfield.dart';
import 'package:physiatrix/Screens/UserProfiling/signup.dart';
import 'package:physiatrix/navbar.dart';
import 'package:physiatrix/navbar1.dart';

class Login extends StatefulWidget {
  final String role;
  const Login({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _error = '';

  Future<void> _handleLogin(BuildContext context) async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        setState(() {
          _error = 'Email and password are required';
        });
        return;
      }

      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResult.user != null) {
        onLoginSuccess();
      } else {
        setState(() {
          _error = 'Invalid email or password';
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      print("Login error: $_error");
    }
  }

  void onLoginSuccess() {
    if (widget.role == 'patient') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyNavBar(),
        ),
      );
    } else if (widget.role == 'doctor') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyNavBar1(),
        ),
      );
    }
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void _showResetPasswordModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 390.h,
            width: 375.w,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 12.h),
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  Text(
                    'Enter your email we will send you a password reset link.',
                    style: TextStyle(
                      color: const Color(0xFF677294),
                      fontSize: 14.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w400,
                      height: 1.66,
                      letterSpacing: -0.30,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 36.h, right: 20.w, bottom: 30.h),
                    child: AuthTextField(
                      label: 'Email',
                      controller: _emailController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: InkWell(
                      onTap: () {
                        passwordReset();
                      },
                      child: const MainButton(text: 'Continue'),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 70.h),
                    child: Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoogleButton(),
                      FacebookButton(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 23.h),
                  child: AuthTextField(
                    label: 'Email',
                    controller: _emailController,
                  ),
                ),
                PasswordTextField(
                  controller: _passwordController,
                ),
                if (_error.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 15.h),
                    child: Text(
                      _error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => _showResetPasswordModal(context),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF0EBE7F),
                            fontSize: 14,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      _handleLogin(context); // Handle login attempt
                    },
                    child: const MainButton(text: 'Login'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 140.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: const Color(0xFF0EBE7F),
                          fontSize: 14.sp,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()),
                          );
                        },
                        child: Text(
                          'Join us',
                          style: TextStyle(
                            color: const Color(0xFF0EBE7F),
                            fontSize: 14.sp,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.30,
                          ),
                        ),
                      )
                    ],
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
