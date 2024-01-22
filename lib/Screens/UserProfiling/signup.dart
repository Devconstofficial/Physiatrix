import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:physiatrix/Components/authtextfield.dart';
import 'package:physiatrix/Components/facebookbutton.dart';
import 'package:physiatrix/Components/googlebutton.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Components/passwordtextfield.dart';
import 'package:physiatrix/Screens/UserProfiling/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _error = '';

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _handleSignup(BuildContext context) async {
    try {
      final String name = _nameController.text.trim();
      final String email = _emailController.text.trim();
      final String password = _passwordController.text;

      if (!_isValidPassword(password) || !isEmailValid(email)) {
        setState(() {
          _error = 'Invalid email or password format';
        });
        return;
      }

      final UserCredential authResult =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(authResult.user!.uid).set({
        'name': name,
        'email': email,
      });
      print('dajsgd');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Login(
                  role: '',
                )),
      );
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      print("Registration error: $_error");
    }
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
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
                Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: Center(
                    child: Text(
                      'Create Account',
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
                  padding: EdgeInsets.only(top: 90.h),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [GoogleButton(), FacebookButton()],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
                  child: AuthTextField(
                    label: 'Name',
                    controller: _nameController,
                  ),
                ),
                AuthTextField(
                  label: 'Email',
                  controller: _emailController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: PasswordTextField(
                    controller: _passwordController,
                  ),
                ),
                if (_error.isNotEmpty)
                  Text(
                    _error,
                    style: const TextStyle(color: Colors.red),
                  ),
                Center(
                  child: InkWell(
                    onTap: () {
                      _handleSignup(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: const MainButton(text: 'Sign up'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFF0EBE7F),
                          fontSize: 14,
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
                                builder: (context) => const Login(
                                      role: '',
                                    )),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF0EBE7F),
                            fontSize: 14,
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
