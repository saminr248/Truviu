import 'package:flutter/material.dart';

class White extends StatefulWidget {
  const White({Key? key}) : super(key: key);

  @override
  State<White> createState() => _WhiteState();
}

class _WhiteState extends State<White> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
