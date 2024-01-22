import 'package:flutter/material.dart';

class LinearBar1 extends StatefulWidget {
  const LinearBar1({Key? key}) : super(key: key);

  @override
  _LinearBar1State createState() => _LinearBar1State();
}

class _LinearBar1State extends State<LinearBar1> {
  double _progressValue = 0.0;

  void updateProgress() {
    setState(() {
      _progressValue += 1 / 7;
      if (_progressValue > 1.0) {
        _progressValue = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LinearProgressIndicator(
          value: _progressValue,
          backgroundColor: Colors.grey,
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD3F36B)),
        ),
      ],
    );
  }
}
