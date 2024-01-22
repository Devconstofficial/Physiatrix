import 'package:flutter/material.dart';
import 'package:physiatrix/Screens/Home/bookappointment.dart';
import 'package:physiatrix/Screens/Home/home.dart';
import 'package:physiatrix/Screens/Home/paymentmethod.dart';
import 'package:physiatrix/Screens/Home/specialistprofile.dart';

class Empty1 extends StatefulWidget {
  static const String id = 'empty1';
  const Empty1({super.key});

  @override
  State<Empty1> createState() => _EmptyState();
}

class _EmptyState extends State<Empty1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/specialistprofile': (context) => SpecialistProfile(
              doctorData: null,
            ),
        '/bookappointment': (context) => BookAppointment(),
        '/paymentmethod': (context) => PaymentMethod(),
      },
    );
  }
}
