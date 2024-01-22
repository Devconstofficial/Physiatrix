import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:physiatrix/Components/mainbutton.dart';
import 'package:physiatrix/Components/multilinetext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// ignore: must_be_immutable
class WriteReview extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var docData;

  WriteReview({
    required this.docData,
    Key? key,
    doctorDocumentID,
    String? doctorDocumentId,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  TextEditingController reviewController = TextEditingController();
  double rating = 4.0; // Initial rating

  final patientUID = FirebaseAuth.instance.currentUser?.uid;

  Future<void> submitReview() async {
    try {
      final Map<String, dynamic> reviewData = {
        'text': reviewController.text,
        'rating': rating,
        'patientUID': patientUID, // Replace with the actual patient's UID
        'doctorDocumentID': widget.docData['documentID'],
        'timestamp': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('reviews').add(reviewData);

      // Optionally, you can display a success message or navigate to another screen.
    } catch (error) {
      // Handle errors
      print('Error submitting review: $error');
    }
  }

  Future<String> getDoctorName(String doctorId) async {
    final doctorSnapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(doctorId)
        .get();

    return doctorSnapshot.data()?['name'] ?? 'Dr. Unknown';
  }

  Future<String> getDoctorImageUrl(String doctorId) async {
    final ref =
        FirebaseStorage.instance.ref().child('doctor_images/$doctorId.jpg');
    final downloadURL = await ref.getDownloadURL();

    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null,
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Scaffold(
              body: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                const Color(0xFFD3F36B).withOpacity(0.6),
                                const Color(0xFFD3F36B).withOpacity(0.6),
                                const Color(0xFFD3F36B),
                              ],
                              stops: const [0.0, 0.6, 0.8, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 23),
                                child: Text(
                                  'Write a Review',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 24,
                                    fontFamily: 'Red Hat Display',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 236,
                                height: 239,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      widget.docData['doctorProfile']
                                          ['image_url'],
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(180),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'How was your experience \nwith ${widget.docData['doctorProfile']['name']}?',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF153144),
                                  fontSize: 16,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              itemSize: 30,
                              initialRating: 4,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xFFD3F36B),
                              ),
                              onRatingUpdate: (newRating) {
                                setState(() {
                                  rating = newRating;
                                });
                              },
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Write a review                                   ',
                                      style: TextStyle(
                                        color: Color(0xFF153144),
                                        fontSize: 16,
                                        fontFamily: 'Red Hat Display',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Max 400 Words',
                                      style: TextStyle(
                                        color: Color(0xFF153144),
                                        fontSize: 14,
                                        fontFamily: 'Red Hat Display',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: MultiLineText(
                            textController: reviewController,
                            label: 'Tell us about your experience',
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        InkWell(
                          onTap: () {
                            submitReview();
                          },
                          child: const MainButton(
                            text: 'Submit Review',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
