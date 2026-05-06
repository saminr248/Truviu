import 'package:flutter/material.dart';
import 'package:truviu_bvp/video_player_final/colors.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  const LeftPanel({
    Key? key,
    required this.size,
    required this.name,
    required this.caption,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      // height: size.height * 0.88,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Text(
            caption,
            style: TextStyle(color: white),
          ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
