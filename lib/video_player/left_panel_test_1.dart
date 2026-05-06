import 'package:flutter/material.dart';

import 'colors.dart';

class LeftPanelTest1 extends StatelessWidget {
  final String name;
  final String caption;
  const LeftPanelTest1({
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
      height: size.height * 0.88,
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
          SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: TextStyle(color: white),
          ),
        ],
      ),
    );
  }
}