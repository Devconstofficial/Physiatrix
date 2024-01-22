import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Screens/PatientProfile/contactus.dart';
import 'package:physiatrix/Screens/PatientProfile/editprofile.dart';
import 'package:physiatrix/Screens/PatientProfile/privacypolicay.dart';
import 'package:physiatrix/Screens/PatientProfile/termsconditions.dart';
import 'package:physiatrix/Screens/UserProfiling/login.dart';
import 'package:physiatrix/Widgets/PatientProfile/logoutbutton.dart';
import 'package:physiatrix/Widgets/PatientProfile/screenbutton.dart';
import 'package:physiatrix/Widgets/PatientProfile/topcard.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  File? _selectedImage;
  String _fullName = ''; // Add this line
  String _imageUrl = '';

  Future<void> signout() async {
    try {
      await FirebaseAuth.instance.signOut();

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch user data from Firestore and Firebase Storage
    fetchUserDataFromFirestore();
  }

  Future<void> fetchUserDataFromFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userUid = user.uid;

        final DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('editprofile')
            .doc(userUid)
            .get();

        if (userData.exists) {
          setState(() {
            _fullName = userData['fullName'];
            _imageUrl = userData['imageUrl'];
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(
                                  onImageSelected: (imageFile) {
                                    setState(() {
                                      _selectedImage = imageFile;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          child: TopCard(
                            imageFile: _selectedImage,
                            fullName: _fullName,
                            imageUrl: _imageUrl,
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 80.h, bottom: 20.h),
                        child: const ScreenButton(
                            svgAsset: 'assets/images/invite.svg',
                            buttonText: 'Invite Friends'),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TermsConditions()),
                          );
                        },
                        child: const ScreenButton(
                            svgAsset: 'assets/images/TandC.svg',
                            buttonText: 'Terms & Conditions'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ContactUs()),
                            );
                          },
                          child: const ScreenButton(
                              svgAsset: 'assets/images/faq.svg',
                              buttonText: 'FAQs'),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactUs()),
                          );
                        },
                        child: const ScreenButton(
                            svgAsset: 'assets/images/contactus.svg',
                            buttonText: 'Contact us'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 50.h),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicy()),
                            );
                          },
                          child: const ScreenButton(
                              svgAsset: 'assets/images/pp.svg',
                              buttonText: 'Privacy Policy'),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            signout();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login(
                                        role: '',
                                      )),
                            );
                          },
                          child: const LogoutButton(text: 'Log Out')),
                      SizedBox(
                        height: 20.h,
                      )
                    ])))));
  }
}
