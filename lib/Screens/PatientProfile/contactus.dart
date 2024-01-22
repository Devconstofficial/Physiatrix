import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:physiatrix/Components/bartop.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Components/maintextfield.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    Future<void> _storeUserData() async {
      try {
        final CollectionReference contactUsCollection =
            FirebaseFirestore.instance.collection('contact_us');

        await contactUsCollection.add({
          'name': nameController.text,
          'email': emailController.text,
          'message': messageController.text,
        });

        nameController.clear();
        emailController.clear();
        messageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xFFD3F36B),
            content: Text('Message sent successfully!'),
          ),
        );
      } catch (error) {
        print('Error storing user data: $error');
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BarTop(text: 'Contact us'),
                Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
                  child: MainTextField(
                    label: 'Name',
                    controller: nameController,
                    textController: nameController,
                  ),
                ),
                MainTextField(
                  label: 'Email',
                  controller: emailController,
                  textController: emailController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                  child: TextField(
                    controller: messageController,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Color(0xFFD3F36B)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFFD3F36B)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      hintText: 'Write your Message',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    minLines: 8,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 180.h),
                    child: InkWell(
                      onTap: () {
                        if (nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            messageController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color(0xFFD3F36B),
                              content: Text('Please fill in all fields.'),
                            ),
                          );
                        } else {
                          _storeUserData();
                        }
                      },
                      child: const MainButton(
                        text: 'Send Message',
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
