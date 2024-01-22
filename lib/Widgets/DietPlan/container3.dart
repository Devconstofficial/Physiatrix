import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:physiatrix/Components/modalfield.dart';

class Container3 extends StatelessWidget {
  final String mealType;
  final String totalCarbs;
  final String foodName;
  final String calories;
  final String protein;
  final String fats;

  const Container3({
    required this.mealType,
    required this.totalCarbs,
    required this.foodName,
    required this.calories,
    required this.protein,
    required this.fats,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365.w,
      height: 110.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mealType,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Red Hat Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showAddFoodAlertDialog(context);
                  },
                  child: Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 235, 235),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/plus.png',
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Total Carbs $totalCarbs',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFF08000),
                fontSize: 12.sp,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 34.w,
                        height: 34.h,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(255, 235, 235, 235),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                        ),
                        child: Image.asset(
                          'assets/images/bowl.png',
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Text(
                            foodName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: calories,
                                style: TextStyle(
                                  color: const Color(0xFFBF40BF),
                                  fontSize: 11.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: '  Cal | ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: protein,
                                style: TextStyle(
                                  color: const Color(0xFF3D7BD9),
                                  fontSize: 11.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: '  Protein | ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: fats,
                                style: TextStyle(
                                  color: const Color(0xFF0BDA51),
                                  fontSize: 11.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: '  Fats',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddFoodAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: Text(
          "Add Food",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontFamily: 'Red Hat Display',
            fontWeight: FontWeight.w700,
          ),
        )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content:  const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ModalField(label: 'Food Name'),
            TextField(
              decoration: InputDecoration(
                labelText: "Food Name",
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Calories"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Protein"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Fats"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Save the added food details and close the alert dialog
              Navigator.of(context).pop();
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}
