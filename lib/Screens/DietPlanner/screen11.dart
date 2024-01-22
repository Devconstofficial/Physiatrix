import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Widgets/DietPlan/container3.dart';
import 'package:physiatrix/Widgets/DietPlan/steptracker.dart';
import 'package:physiatrix/Widgets/DietPlan/watercontainer.dart';

class Screen11 extends StatelessWidget {
  const Screen11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Summary',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontFamily: 'Red Hat Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  width: 365.w,
                  height: 189.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Container(
                              width: 120.w,
                              height: 120.h,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF08000),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLinearProgressBar(
                              label: '0.0g / 32g  Carbs',
                              value: 0.8,
                              color: const Color(0xFFF08000),
                            ),
                            _buildLinearProgressBar(
                              label: '0.0g / 205g  Fats',
                              value: 0.5,
                              color: const Color(0xFF98FB98),
                            ),
                            _buildLinearProgressBar(
                              label: '0.0g / 164g  Proteins',
                              value: 0.6,
                              color: const Color.fromARGB(255, 165, 216, 239),
                            ),
                            _buildLinearProgressBar(
                              label: '0 / 2630  Calories',
                              value: 0.7,
                              color: const Color(0xFFCF9FFF),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 2nd Container
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Container(
                    width: 365.w,
                    height: 50.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 6.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your Carb Intake',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'Red Hat Display',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '45.3 %',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFFEF2525),
                                    fontSize: 12.sp,
                                    fontFamily: 'Red Hat Display',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _mybuildLinearProgressBar(
                            value: 0.4,
                            color: const Color(0xFFEF2525),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 3rd Container

                Padding(
                    padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                    child: const Container3(
                        mealType: 'BREAKFAST',
                        totalCarbs: '40.0 g',
                        foodName: 'Egg',
                        calories: '30',
                        protein: '10.0 g',
                        fats: '40.0 g')),

                Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: const Container3(
                        mealType: 'LUNCH',
                        totalCarbs: '60.0 g',
                        foodName: 'Biryani',
                        calories: '100',
                        protein: '40.0 g',
                        fats: '100.0 g')),
                Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: const Container3(
                        mealType: 'SNACKS',
                        totalCarbs: '10.0 g',
                        foodName: 'Biscuits & Fruits',
                        calories: '200',
                        protein: '60.0 g',
                        fats: '80.0 g')),
                Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: const Container3(
                        mealType: 'DINNER',
                        totalCarbs: '70.0 g',
                        foodName: 'Pasta',
                        calories: '70',
                        protein: '60.0 g',
                        fats: '250.0 g')),

                const StepTracker(),
                SizedBox(
                  height: 30.h,
                ),
                const WaterContainer(),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: CircularMenu(
          alignment: Alignment.bottomRight,
          curve: Curves.bounceOut,
          startingAngleInRadian: 2.2,
          endingAngleInRadian: 5,
          radius: 100,
          toggleButtonSize: 30.0,
          toggleButtonColor: Colors.black,
          toggleButtonIconColor: Colors.white,
          items: [
            CircularMenuItem(
              onTap: () {},
              icon: Icons.camera_alt,
              color: Colors.blue,
            ),
            CircularMenuItem(
              onTap: () {},
              icon: Icons.breakfast_dining,
              color: Colors.blue,
            ),
            CircularMenuItem(
              onTap: () {},
              icon: Icons.camera_alt,
              color: Colors.blue,
            ),
            CircularMenuItem(
              onTap: () {},
              icon: Icons.image,
              color: Colors.green,
            ),
          ],
          animationDuration: const Duration(milliseconds: 300),
          toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
        ),
      ),
    );
  }

  Widget _buildLinearProgressBar({
    required String label,
    required double value,
    required Color color,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.w),
            child: Text(
              ' $label',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: 179.w,
            height: 9.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: value,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mybuildLinearProgressBar({
    required double value,
    required Color color,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Container(
        width: 326.w,
        height: 9.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: value,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ),
    );
  }
}
