import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Components/phonetext.dart';
import 'package:physiatrix/Components/smalltextfield.dart';
import 'package:physiatrix/Widgets/PaymentMethod/paymentbuttons.dart';
import '../../Components/maintextfield.dart';

class PaymentMethod extends StatefulWidget {
  
 PaymentMethod({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _expdateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isVisaSelected = true; 
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(
                                      'assets/images/arrow.svg',
                                      height: 20.h,
                                      width: 20.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 23.w),
                                    child: Text(
                                      'Payment',
                                      style: TextStyle(
                                        color: const Color(0xFF333333),
                                        fontSize: 24.sp,
                                        fontFamily: 'Red Hat Display',
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Text(
                              'Select Payment Method',
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 18.sp,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15.h, left: 20.w, right: 20.w),
                            child: PaymentButtons(
                              onPaymentMethodSelected: (isVisa) {
                                setState(() {
                                  isVisaSelected =
                                      isVisa; 
                                });
                              },
                            ),
                          ),
                          Visibility(
                            visible: isVisaSelected, 
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                              child: Container(
                                width: 350.w,
                                height: 190.h,
                                decoration: ShapeDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/visa.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !isVisaSelected,
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                              child: Container(
                                width: 350.w,
                                height: 190.h,
                                decoration: ShapeDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/card.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Fill Card Details',
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 18.sp,
                              fontFamily: 'Red Hat Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: MainTextField(label: 'Name', controller: _nameController,),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                              child: PhoneTextField(label: 'Card Number')),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallTextField(label: 'Expiry Date', controller: _expdateController,),
                              SmallTextField(label: 'CVC', controller: _cvcController,)
                            ],
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const PaymentAlertDialog();
                                  },
                                );
                              },
                              child: const MainButton(
                                text: 'Pay',
                              ),
                            ),
                          ))
                        ])))));
  }
}

class PaymentAlertDialog extends StatelessWidget {
  const PaymentAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: const Color.fromRGBO(211, 243, 107, 1),
      title: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/dialog.png',
              height: 200.h,
              width: 200.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Appointment Successful',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Your appointment has been booked. Dr. Altamas will contact you soon.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.30,
            ),
          ),
          SizedBox(
            height: 40.h,
          )
        ],
      ),
    );
  }
}
