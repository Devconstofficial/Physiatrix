import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:physiatrix/Screens/DietPlanner/screen2.dart';
import 'package:physiatrix/Widgets/DietPlan/linearprogressbar.dart';

void main() {
  runApp(GetMaterialApp(home: Screen1()));
}

class ButtonController extends GetxController {
  RxInt selectedButtonIndex = RxInt(-1);
}

class ProgressController extends GetxController {
  RxDouble progressValue = RxDouble(0.0);
}

class Screen1 extends StatelessWidget {
  final ButtonController buttonController = Get.put(ButtonController());
  final ProgressController progressController = Get.put(ProgressController());

  final List<String> buttonLabels = [
    'Lose Weight',
    'Maintain Weight',
    'Build Muscles'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  titleSpacing: 0,
                  leading: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: const Color(0xFFD3F36B),
                        fontSize: 16.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  title: Text(
                    'Step 1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.30,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Screen2()),
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: const Color(0xFFD3F36B),
                          fontSize: 16.sp,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ],
                  centerTitle: true,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: const LinearBar1(),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                    child: Text(
                      'What’s your goal?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Please select what you would like us to \nhelp you achieve.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                for (int index = 0; index < buttonLabels.length; index++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 27.h),
                    child: ColorButton(
                      text: buttonLabels[index],
                      index: index,
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

class ColorButton extends StatelessWidget {
  final String text;
  final int index;

  const ColorButton({Key? key, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonController buttonController = Get.find();

    return GestureDetector(
      onTap: () {
        // Change color first
        buttonController.selectedButtonIndex.value = index;
      },
      child: Obx(() {
        final isSelected = buttonController.selectedButtonIndex.value == index;

        return Center(
          child: Container(
            width: 325.w,
            height: 65.h,
            decoration: ShapeDecoration(
              color: isSelected ? const Color(0xFFD3F36B) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.black : const Color(0xFF2F3530),
                  fontSize: 18.sp,
                  fontFamily: 'Red Hat Display',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.30,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
