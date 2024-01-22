import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoCallPage extends StatelessWidget {
  const VideoCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getDoctorIdForAppointment(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final doctorUserId = snapshot.data;

        if (doctorUserId == null) {
          return const Text('No appointment found');
        }

        return ZegoUIKitPrebuiltCall(
          appID: 636186889,
          appSign:
              "7bd945700bb5872edb75a27f9b9d6ae4ae43624429e944f7a4417e68fe99dee1",
          userID: FirebaseAuth
              .instance.currentUser!.uid, // Current user (patient) ID
          userName: "Patient Name", // Set the patient's name here
          callID: doctorUserId, // Use the doctor's user ID as callID
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
            ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
        );
      },
    );
  }

  Future<String?> _getDoctorIdForAppointment() async {
    final user = FirebaseAuth.instance.currentUser;
    final appointmentsCollection =
        FirebaseFirestore.instance.collection('appointments');
    final appointmentQuery = await appointmentsCollection
        .where('userId', isEqualTo: user!.uid)
        .limit(1)
        .get();

        

    if (appointmentQuery.docs.isNotEmpty) {
      // Extract the doctor's user ID from the appointment document
      return appointmentQuery.docs[0]['doctorProfile']['doctorUserId'];
    } else {
      return null;
    }
  }
}
