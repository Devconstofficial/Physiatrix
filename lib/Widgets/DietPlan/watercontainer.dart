import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterContainer extends StatefulWidget {
  const WaterContainer({Key? key}) : super(key: key);

  @override
  _WaterContainerState createState() => _WaterContainerState();
}

class _WaterContainerState extends State<WaterContainer> {
  double waterLevel = 0.0;
  double goal = 2.0;

  void increaseWaterLevel() {
    if (waterLevel < goal) {
      setState(() {
        waterLevel = (waterLevel + 0.25).clamp(0.0, goal);
      });
    }
  }

  void decreaseWaterLevel() {
    if (waterLevel > 0.0) {
      setState(() {
        waterLevel = (waterLevel - 0.25).clamp(0.0, goal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365.w,
      height: 130.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WATER',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.h, bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: decreaseWaterLevel,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF89CFF0),
                        shape: CircleBorder(),
                      ),
                      child: Image.asset('assets/images/subtract.png'),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    '${waterLevel.toStringAsFixed(2)} Liters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF7393B3),
                      fontSize: 14.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  GestureDetector(
                    onTap: increaseWaterLevel,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF89CFF0),
                        shape: CircleBorder(),
                      ),
                      child: Image.asset('assets/images/add.png'),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'Goal : $goal Liters',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Red Hat Display',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
