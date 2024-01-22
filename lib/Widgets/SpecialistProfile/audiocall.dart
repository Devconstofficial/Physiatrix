import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioCall extends StatefulWidget {
  final bool isSelected;
  const AudioCall({Key? key, this.isSelected = false}) : super(key: key);

  @override
  _AudioCallState createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300), // Adjust the duration as needed
    );

    _animation = Tween<double>(begin: 1, end: 1.1).animate(_controller);

    // Add listener to rebuild the widget when animation changes
    _animation.addListener(() {
      setState(() {});
    });

    // Reverse the animation when widget is initially built
    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AudioCall oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value, // Apply the scale animation
      child: Container(
        width: 295.w,
        height: 54.h,
        decoration: ShapeDecoration(
          color: widget.isSelected ? const Color(0xFFD3F36B) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w),
                  child: Row(
                    children: [
                      Text(
                        'Audio Call',
                        style: TextStyle(
                          color: const Color(0xFF153144),
                          fontSize: 16.sp,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Text(
                        '\$5',
                        style: TextStyle(
                          color: const Color(0xFF153144),
                          fontSize: 16.sp,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 2.h),
                      child: Text(
                        'Discuss everything on audio call.',
                        style: TextStyle(
                          color: const Color(0xFF153144),
                          fontSize: 12.sp,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 70.w,
                  height: 54.h,
                  child: Center(
                    child: Image.asset(
                      'assets/images/audio.png',
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
