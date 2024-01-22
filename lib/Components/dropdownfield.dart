import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_list_pick/country_list_pick.dart';

class DropDownField extends StatelessWidget {
  final String label;
  const DropDownField(
      {Key? key,
      required this.label,
      required TextEditingController controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 60,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: const Color(0xFFD3F36B)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: CountryListPick(
        appBar: AppBar(
          title: const Text('Select a Country'),
        ),
        onChanged: (CountryCode? countryCode) {},
        initialSelection: null,
      ),
    );
  }
}
