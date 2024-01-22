import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:physiatrix/Screens/Appointments/myappointments.dart';
import 'package:physiatrix/Screens/Chatbot/chatscreen.dart';
import 'package:physiatrix/Screens/PatientProfile/profilepage.dart';
import 'package:physiatrix/empty.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _NavBArState();
}

class _NavBArState extends State<MyNavBar> {
  List<Widget> screens = [
    const Empty1(),
    const MyAppointments(),
    const ChatScreen(),
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
              icon: SvgPicture.asset('assets/images/home3.svg'),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/list4.svg'),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/message.svg'),
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
