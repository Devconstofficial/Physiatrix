import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:physiatrix/Screens/DietPlanner/screen11.dart';

class Screen10 extends StatefulWidget {
  const Screen10({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Screen10State createState() => _Screen10State();
}

class _Screen10State extends State<Screen10>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _percentageAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<Color?> _textColorAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: const Color(0xFFD3F36B),
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _percentageAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _textOpacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _textColorAnimation = ColorTween(begin: Colors.grey, end: Colors.black)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _startProgress();
  }

  void _startProgress() {
    Future.delayed(const Duration(seconds: 1), () {
      _animationController.forward().whenComplete(() {
        // Delay for 2 seconds before navigating to the next screen
        Future.delayed(const Duration(seconds: 2), () {
          _navigateToNextScreen();
        });
      });
      setState(() {
        _progress = 1.0;
      });
    });
  }

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Screen11()),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 100.h),
                    child: Text(
                      'Processing your plan',
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
                ),
                Center(
                  child: Transform.rotate(
                    angle:
                        _rotationAnimation.value * 2 * 3.1416, // Full rotation
                    child: CircularPercentIndicator(
                      radius: 70.0,
                      lineWidth: 10.0,
                      percent: _progress,
                      progressColor: _colorAnimation.value,
                      center: Text(
                        '${(_percentageAnimation.value * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD3F36B),
                        ),
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Text(
                        'Get ready for your',
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
                  ),
                ),
                Center(
                  child: Text(
                    'Build Muscle Journey ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 240.h,
                ),
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Center(
                    child: Text(
                      'Calculating your daily Carbs...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _textColorAnimation.value,
                        fontSize: 20.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Center(
                    child: Text(
                      'Calculating your daily CALORIES...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _textColorAnimation.value,
                        fontSize: 20.sp,
                        fontFamily: 'Red Hat Display',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.30,
                      ),
                    ),
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

void main() {
  runApp(const MaterialApp(
    home: Screen10(),
  ));
}
