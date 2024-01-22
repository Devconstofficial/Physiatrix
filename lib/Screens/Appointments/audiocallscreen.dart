import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Text('No data available');
        }

        final userData = snapshot.data!;

        // Check if userID and userName are not null before using them
        final userID = userData['user_id'] ?? '';
        final userName = userData['user_name'] ?? '';

        // Print userID and userName to the console
        print('userID: $userID');
        print('userName: $userName');

        return ZegoUIKitPrebuiltCall(
          appID: 636186889,
          appSign:
              "7bd945700bb5872edb75a27f9b9d6ae4ae43624429e944f7a4417e68fe99dee1",
          userID: "t6xni24VUNNfDcuc4dsRjhmSUXJ2",
          userName: "Khezar Mahmood",
          callID: callID,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
            ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
        );
      },
    );
  }

  Future<Map<String, dynamic>> _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    final userSnapshot = await userDoc.get();

    if (userSnapshot.exists) {
      return userSnapshot.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }
}
