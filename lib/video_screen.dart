import 'package:flutter/material.dart';

import 'video_player/video_player_test_3.dart';

class Blank extends StatefulWidget {
  const Blank({Key? key}) : super(key: key);

  @override
  State<Blank> createState() => _BlankState();
}

class _BlankState extends State<Blank> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: TestPage3()),
      ),
    ));
  }
}
