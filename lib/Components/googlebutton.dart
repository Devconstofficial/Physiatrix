import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physiatrix/Screens/UserProfiling/googlesigin.dart';
import 'package:provider/provider.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final provider =
            Provider.of<GoogleSigninProvider>(context, listen: false);
        provider.googleLogin();
      },
      child: Container(
        width: 153,
        height: 56,
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: SvgPicture.asset('assets/images/google.svg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Google',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'Red Hat Display',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
