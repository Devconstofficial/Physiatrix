import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physiatrix/Screens/Appointments/myappointments.dart';
import 'package:physiatrix/Screens/Appointments/review.dart';
import 'package:physiatrix/Screens/PatientProfile/doctorprofile.dart';
import 'package:physiatrix/Screens/PatientProfile/profilepage.dart';

class MyNavBar1 extends StatefulWidget {
  const MyNavBar1({Key? key}) : super(key: key);

  @override
  State<MyNavBar1> createState() => _NavBArState();
}

class _NavBArState extends State<MyNavBar1> {
  List<Widget> screens = [
    const MyAppointments(),
     const ReviewPage(),
    const DoctorProfile(),
    const PatientProfile(),
  ];

  int currentindex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/list4.svg'),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/review.png'),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/456.svg'),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/profile3.svg'),
              label: '',
              backgroundColor: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
