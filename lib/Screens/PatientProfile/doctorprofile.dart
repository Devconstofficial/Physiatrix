import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/mainbutton1.dart';
import 'package:physiatrix/Components/maintextfield.dart';
import 'package:physiatrix/Components/multilinetext.dart';
import 'package:physiatrix/Components/phonetext.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  File? _imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveDataToFirestore() async {
    try {
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('doctor_images/${DateTime.now().toString()}');
      print('Uploading image');
      final UploadTask uploadTask = storageReference.putFile(_imageFile!);
      await uploadTask;
      print('Image uploaded');

      final imageUrl = await storageReference.getDownloadURL();
      print('Image URL fetched: $imageUrl');

      final doctorData = {
        'name': nameController.text,
        'contact': contactController.text,
        'designation': designationController.text,
        'hospital': hospitalController.text,
        'description': descriptionController.text,
        'price': priceController.text,
        'image_url': imageUrl,
      };

      final doctorRef = await FirebaseFirestore.instance
          .collection('doctors')
          .add(doctorData);

      // Update the document with its own ID
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(doctorRef.id)
          .update({'doctorUserId': doctorRef.id});
      print(doctorRef.id);

      // Clear the text fields
      nameController.clear();
      contactController.clear();
      designationController.clear();
      hospitalController.clear();
      descriptionController.clear();
      priceController.clear();

      print('Data saved successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFFD3F36B),
          content: Text('Data saved successfully!'),
        ),
      );
    } catch (error) {
      print('Error saving data: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error saving data. Please try again later.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    contactController.dispose();
    designationController.dispose();
    hospitalController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                Container(
                  width: 220.w,
                  height: 220.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: _imageFile != null
                      ? ClipOval(
                          child: Image.file(
                            _imageFile!,
                            width: 220.w,
                            height: 220.h,
                          ),
                        )
                      : Center(
                          child: Text(
                            'Choose a photo',
                            style: TextStyle(
                              color: const Color(0xFF677294),
                              fontSize: 16.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w300,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD3F36B),
                      ),
                      child: const Text('Camera'),
                    ),
                    SizedBox(width: 25.w),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD3F36B),
                      ),
                      child: const Text('Gallery'),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                MainTextField(
                    label: 'Name',
                    textController: nameController,
                    controller: nameController),
                SizedBox(height: 25.h),
                PhoneTextField(
                  label: 'Contact',
                  textController: contactController,
                ),
                SizedBox(height: 25.h),
                MainTextField(
                  label: 'Designation',
                  textController: designationController,
                  controller: designationController,
                ),
                SizedBox(height: 25.h),
                MainTextField(
                  label: 'Hospital',
                  textController: hospitalController,
                  controller: hospitalController,
                ),
                SizedBox(height: 25.h),
                MultiLineText(
                  label: 'Description',
                  textController: descriptionController,
                ),
                SizedBox(height: 25.h),
                PhoneTextField(
                  label: 'Price',
                  textController: priceController,
                ),
                SizedBox(height: 50.h),
                MainButton1(
                  text: 'Save',
                  onPressed: _saveDataToFirestore,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
