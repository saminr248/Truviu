import 'package:flutter/material.dart';

class NoContent extends StatefulWidget {
  const NoContent({Key? key}) : super(key: key);

  @override
  State<NoContent> createState() => _NoContentState();
}

class _NoContentState extends State<NoContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black

      ),
      body: Center(
        child: Text(
          'Sorry Content Not Available Yet',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold

        ),),
      )
    ));
  }
}
