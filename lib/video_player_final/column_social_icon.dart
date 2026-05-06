import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:truviu_bvp/video_player_final/colors.dart';
import 'package:video_player/video_player.dart';

class getProfile extends StatefulWidget {
  final String img;
  getProfile({required this.img, Key? key}) : super(key: key);

  @override
  State<getProfile> createState() => _getProfileState();
}

class _getProfileState extends State<getProfile> {
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
                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ProfileScreen()));
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.img),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}


