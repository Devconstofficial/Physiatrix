import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DateField extends StatefulWidget {
  final String label;
  DateField(
      {super.key,
      required this.label,
      required TextEditingController controller});

  TextEditingController? controller;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        _selectDate(context);
      },
      readOnly: true, // Prevents keyboard from showing
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFD3F36B)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFD3F36B)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        hintText: widget.label,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontFamily: 'Red Hat Display',
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: _selectedDate != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _selectedDate = null;
                  });
                },
                icon: Icon(Icons.clear),
              )
            : null,
      ),
      controller: TextEditingController(
        text: _selectedDate != null
            ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
            : null,
      ),
    );
  }
}
