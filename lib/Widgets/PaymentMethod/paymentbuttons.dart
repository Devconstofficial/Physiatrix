import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentButtons extends StatefulWidget {
  final ValueChanged<bool> onPaymentMethodSelected;

  const PaymentButtons({Key? key, required this.onPaymentMethodSelected}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentButtonsState createState() => _PaymentButtonsState();
}

class _PaymentButtonsState extends State<PaymentButtons> {
  bool isVisaSelected = true;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isVisaSelected = true;
              widget.onPaymentMethodSelected(true); 
            });
          },


          child: Container(
            width: 113.w,
            height: 57.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: SvgPicture.asset(
              'assets/images/visa.svg',
              width: 113.w,
              height: 57.h,
            ),
          ),
        )
      ]),
      Column(
        children: [
          GestureDetector(
            onTap: () {
            setState(() {
              isVisaSelected = false;
              widget.onPaymentMethodSelected(false); 
            });
          },


            child: Container(
              width: 113.w,
              height: 57.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFF2F2F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/mastercard.svg',
                      height: 35.h,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ]);
  }
}
