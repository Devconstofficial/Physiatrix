import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physiatrix/Screens/Home/paymentmethod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Appointment Booking'),
        ),
        body: MyDatePicker(),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyDatePicker extends StatefulWidget {
  MyDatePicker({super.key, this.doctorProfile, this.appointmentType});

  // ignore: prefer_typing_uninitialized_variables
  var doctorProfile;
  String? appointmentType;

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime today = DateTime.now();
  DateTime? selectedDate;
  String? selectedTime;

  List<String> timeSlots = [
    '09.00 AM',
    '10.00 AM',
    '11.00 AM',
    '12.00 PM',
    '13.00 PM',
    '14.00 PM',
    '15.00 PM',
    '16.00 PM',
  ];

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    final today = DateTime.now();

    if (day.isAfter(today) || isSameDay(day, today)) {
      setState(() {
        selectedDate = day;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFFD3F36B),
          content: Text('Cannot select a past date.'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _onTimeSelected(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          rowHeight: 43.h,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, selectedDate),
          focusedDay: today,
          firstDay: DateTime.utc(1980, 4, 13),
          lastDay: DateTime.utc(2060, 4, 13),
          onDaySelected: _onDaySelected,
          calendarFormat: CalendarFormat.month,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            CalendarFormat.week: 'Week',
          },
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            todayTextStyle: TextStyle(
              color: Colors.amber,
            ),
            selectedDecoration: BoxDecoration(
              color: Color(0xFFD3F36B),
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(
              color: Colors.white,
            ),
            weekendTextStyle: TextStyle(
              color: Colors.red,
            ),
            outsideTextStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          child: Text(
            selectedDate == null
                ? 'Please select a date.'
                : selectedDate!.weekday == DateTime.saturday ||
                        selectedDate!.weekday == DateTime.sunday
                    ? 'Weekend is not available, please select another date.'
                    : 'Select Consultation Time',
            style: TextStyle(
              color: selectedDate == null ||
                      selectedDate!.weekday == DateTime.saturday ||
                      selectedDate!.weekday == DateTime.sunday
                  ? Colors.red
                  : const Color(0xFF153144),
              fontSize: 18.sp,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (selectedDate != null &&
            selectedDate!.weekday != DateTime.saturday &&
            selectedDate!.weekday != DateTime.sunday) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: TimeSlotWidget(
                    time: timeSlots[i],
                    isSelected: selectedTime == timeSlots[i],
                    onTimeSelected: _onTimeSelected,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 4; i < timeSlots.length; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: TimeSlotWidget(
                    time: timeSlots[i],
                    isSelected: selectedTime == timeSlots[i],
                    onTimeSelected: _onTimeSelected,
                  ),
                ),
            ],
          ),
        ],
        SizedBox(height: 110.h),
        InkWell(
          onTap: () async {
            if (selectedDate == null || selectedTime == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color(0xFFD3F36B),
                  content: Text('Please choose a date and time first.'),
                  duration: Duration(seconds: 1),
                ),
              );
            } else {
              // Store data in Firestore
              var docRef = await firestore.collection('appointments').add({
                'selectedDate': selectedDate,
                'selectedTime': selectedTime,
                'userId': user?.uid,
                'timestamp': FieldValue.serverTimestamp(),
                "doctorProfile": widget.doctorProfile,
                "appointmentType": widget.appointmentType
                
              });

             

              // ignore: unnecessary_null_comparison
              if (docRef != null) {
                await firestore
                    .collection('appointments')
                    .doc(docRef.id)
                    .update({"documentId": docRef.id}).then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentMethod()),
                  );
                });
              }
            }
          },
          child: Container(
            width: 295.w,
            height: 54.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFD3F36B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Center(
              child: Text(
                'Book Appointment',
                style: TextStyle(
                  color: const Color(0xFF2F3530),
                  fontSize: 18.sp,
                  fontFamily: 'Red Hat Display',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimeSlotWidget extends StatelessWidget {
  final String time;
  final bool isSelected;
  final Function(String) onTimeSelected;

  const TimeSlotWidget({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color timeSlotColor =
        isSelected ? const Color(0xFFD3F36B) : Colors.white;
    final Color timeSlotTextColor = isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: () => onTimeSelected(time),
      child: Container(
        width: 75.w,
        height: 50.h,
        decoration: ShapeDecoration(
          color: timeSlotColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? timeSlotColor : Colors.black,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              color: timeSlotTextColor,
              fontSize: 14.sp,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
