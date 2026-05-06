import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Samin/profile_screen.dart';
import 'colors.dart';

class getProfileTest1 extends StatefulWidget {
  final String img;
  getProfileTest1({required this.img, Key? key}) : super(key: key);

  @override
  State<getProfileTest1> createState() => _getProfileTest1State();
}

class _getProfileTest1State extends State<getProfileTest1> {
  VideoPlayerController? _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _controller?.pause();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProfileScreen()));
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.img),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}


