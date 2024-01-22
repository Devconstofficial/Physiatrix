import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Screens/DietPlanner/screen9.dart';

class Screen8 extends StatefulWidget {
  const Screen8({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Screen8State createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  List<bool> selectedContainers = List.generate(14, (index) => false);

  void toggleContainerSelection(int index) {
    setState(() {
      selectedContainers[index] = !selectedContainers[index];
    });
  }

  Widget buildSelectableContainer(int index, String imagePath, String label) {
    return GestureDetector(
      onTap: () => toggleContainerSelection(index),
      child: Column(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: ShapeDecoration(
              color: selectedContainers[index]
                  ? const Color(0xFFD3F36B)
                  : Colors.white,
              shape: const CircleBorder(),
            ),
            child: Image.asset(imagePath),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w300,
              letterSpacing: -0.30,
            ),
          ),
        ],
      ),
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
                  child: Text(
                    'Meal Preference',
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
                Center(
                  child: Text(
                    'Please select your preferred food types. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),

                // Row 1
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSelectableContainer(
                          0, 'assets/images/seafood.png', 'Seafood'),
                      buildSelectableContainer(
                          1, 'assets/images/eggs.png', 'Eggs'),
                      buildSelectableContainer(
                          2, 'assets/images/chicken.png', 'Chicken'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSelectableContainer(
                          3, 'assets/images/beef.png', 'Beef'),
                      buildSelectableContainer(
                          4, 'assets/images/fruits.png', 'Fruits'),
                      buildSelectableContainer(
                          5, 'assets/images/vegs.png', 'Vegetables'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                  child: Container(
                    width: 400.w,
                    height: 3.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD3F36B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Please select your preferred food types. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSelectableContainer(
                          6, 'assets/images/vegan.png', 'Vegan'),
                      buildSelectableContainer(
                          7, 'assets/images/vegetarian.png', 'Vegetarian'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                  child: Container(
                    width: 400.w,
                    height: 3.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD3F36B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Please select your preferred food types. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSelectableContainer(
                          9, 'assets/images/dairy.png', 'Dairy'),
                      buildSelectableContainer(
                          10, 'assets/images/eggs.png', 'Eggs'),
                      buildSelectableContainer(
                          11, 'assets/images/wheat.png', 'Wheat'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSelectableContainer(
                          12, 'assets/images/fish.png', 'Fish'),
                      buildSelectableContainer(
                          13, 'assets/images/peanuts.png', 'Peanuts'),
                    ],
                  ),
                ),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Screen9()),
                        );
                      },
                      child: const MainButton(text: 'Next')),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
