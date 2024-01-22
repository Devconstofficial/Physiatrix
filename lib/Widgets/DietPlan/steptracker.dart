import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pedometer/pedometer.dart';

class StepTracker extends StatefulWidget {
  const StepTracker({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StepTrackerState createState() => _StepTrackerState();
}

class _StepTrackerState extends State<StepTracker> {
  Stream<StepCount>? _stepCountStream;
  int _totalSteps = 0;
  String _calories = '0';
  String _distance = '0';

  @override
  void initState() {
    super.initState();
    _startTrackingSteps();
  }

  void _startTrackingSteps() {
    print("kjabjkabkjdnjkankj");
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream!.listen((event) {
      // setState(() {
      _totalSteps = event.steps;
      _calories = (_totalSteps * 0.04)
          .toStringAsFixed(1); // Adjust calorie calculation as needed
      _distance = (_totalSteps * 0.8).toStringAsFixed(1);

      print('Total Steps: $_totalSteps'); // Assuming around 80cm per step
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365.w,
      height: 150.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'STEPS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Red Hat Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/shoe.png'),
            SizedBox(height: 10.h),
            Text(
              ' $_totalSteps Steps',
              style: TextStyle(
                color: const Color(0xFF7393B3),
                fontSize: 16.sp,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' $_distance meters,',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: 'Red Hat Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  ' $_calories Cal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: 'Red Hat Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:pedometer/pedometer.dart';

// String formatDate(DateTime d) {
//   return d.toString().substring(0, 19);
// }

// class StepTracker extends StatefulWidget {
//   @override
//   _StepTrackerState createState() => _StepTrackerState();
// }

// class _StepTrackerState extends State<StepTracker> {
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   String _status = '?', _steps = '?';

//   void onStepCount(StepCount event) {
//     print(event);
//     setState(() {
//       _steps = event.steps.toString();
//     });
//   }

//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }

//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }

//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }

//   void initPlatformState() {
//     print('hekko');
//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen(onPedestrianStatusChanged)
//         .onError(onPedestrianStatusError);

//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);

//     if (!mounted) return;
//   }

//   @override
//   void initState() {
//     initPlatformState();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Steps Taken',
//             style: TextStyle(fontSize: 30),
//           ),
//           Text(
//             _steps,
//             style: TextStyle(fontSize: 60),
//           ),
//           Divider(
//             height: 100,
//             thickness: 0,
//             color: Colors.white,
//           ),
//           Text(
//             'Pedestrian Status',
//             style: TextStyle(fontSize: 30),
//           ),
//           Icon(
//             _status == 'walking'
//                 ? Icons.directions_walk
//                 : _status == 'stopped'
//                     ? Icons.accessibility_new
//                     : Icons.error,
//             size: 100,
//           ),
//           Center(
//             child: Text(
//               _status,
//               style: _status == 'walking' || _status == 'stopped'
//                   ? TextStyle(fontSize: 30)
//                   : TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
