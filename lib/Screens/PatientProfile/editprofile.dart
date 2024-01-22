import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:physiatrix/Components/bartop.dart';
import 'package:physiatrix/Components/datebirth.dart';
import 'package:physiatrix/Components/dropdownfield.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Components/maintextfield.dart';
import 'package:physiatrix/Components/smalltextfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({required this.onImageSelected, Key? key})
      : super(key: key);

  final Function(File?) onImageSelected;

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;

        
        DocumentSnapshot profileSnapshot =
            await _firestore.collection('patientprofiles').doc(userId).get();

        if (profileSnapshot.exists) {
          Map<String, dynamic> profileData =
              profileSnapshot.data() as Map<String, dynamic>;

          setState(() {
            _fullNameController.text = profileData['fullName'] ?? '';
            _emailController.text = profileData['email'] ?? '';
            _dateOfBirthController.text = profileData['dateOfBirth'] ?? '';
            _countryController.text = profileData['country'] ?? '';
            _genderController.text = profileData['gender'] ?? '';
            _addressController.text = profileData['address'] ?? '';
          });
        }
      }
    } catch (error) {
      print('Error loading profile data: $error');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      widget.onImageSelected(_imageFile);
    }
  }

  Future<void> _updateProfile() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;

        
        await _firestore.collection('patientprofiles').doc(userId).set({
          'fullName': _fullNameController.text,
          'email': _emailController.text,
          'dateOfBirth': _dateOfBirthController.text,
          'country': _countryController.text,
          'gender': _genderController.text,
          'address': _addressController.text,
        });

       
        if (_imageFile != null) {
          await saveUserImageToFirestore(_imageFile!);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xFFD3F36B),
            content: Text('Profile updated successfully!'),
          ),
        );
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You are not signed in. Please sign in first.'),
          ),
        );
      }
    } catch (error) {
      
      print('Error updating profile: $error');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating profile: $error'),
        ),
      );
    }
  }

  Future<String> saveUserImageToFirestore(File image) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;

        Reference storageReference =
            FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');

        await storageReference.putFile(image);

        String imageUrl = await storageReference.getDownloadURL();

        
        await _firestore.collection('patientprofiles').doc(userId).update({
          'imageUrl': imageUrl,
        });

        return imageUrl;
      } else {
        return '';
      }
    } catch (error) {
      print('Error saving profile image: $error');
      return '';
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
            child: Column(
              children: [
                const BarTop(text: 'Edit Profile'),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: const Color(0xFFD3F36B).withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.r)),
                      ),
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.camera);
                              },
                              title: Text(
                                'Camera',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              leading: const Icon(
                                Icons.camera,
                                color: Colors.black,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.gallery);
                              },
                              title: Text(
                                'Gallery',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.30,
                                ),
                              ),
                              leading: const Icon(
                                Icons.photo_library,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 35.h, bottom: 35.h),
                    child: Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: _imageFile != null
                            ? DecorationImage(
                                image: FileImage(File(_imageFile!.path)),
                                fit: BoxFit.fill,
                              )
                            : null,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Positioned(
                            bottom: 10.h,
                            right: 10.w,
                            child: Image.asset(
                              'assets/images/select.png',
                              width: 30.w,
                              height: 30.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                MainTextField(
                  label: 'Full Name',
                  textController: _fullNameController,
                  controller: _fullNameController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: MainTextField(
                    label: 'Email Address',
                    textController: _emailController,
                    controller: _emailController,
                  ),
                ),
                DateField(
                  label: 'Date of Birth',
                  controller: _dateOfBirthController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropDownField(
                        label: 'Country',
                        controller: _countryController,
                      ),
                      SmallTextField(
                        label: 'Gender',
                        controller: _genderController,
                      ),
                    ],
                  ),
                ),
                MainTextField(
                  label: 'Address',
                  textController: _addressController,
                  controller: _addressController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 55.h, bottom: 10.h),
                  child: InkWell(
                    onTap: _updateProfile,
                    child: const MainButton(text: 'Confirm'),
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
