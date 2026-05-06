import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'Samin/profile_screen.dart';
import 'userListFinal.dart';

class SearchScreenSideBar extends StatelessWidget {
  IconData icon;
  String val;
  SearchScreenSideBar(this.icon, this.val, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    InkWell(
      onTap: () {
        FirebaseAnalytics.instance.logEvent(name: 'settings_button');
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Users()));
      },
      child: Icon(
      icon,
size: 20,
color: Colors.white,
),
    ),
Text(val, style: TextStyle(color: Colors.white, fontSize: 10))
],
);
  }
}

class SearchScreenCustomIcon extends StatefulWidget {
  IconData icon;
  String val;
  SearchScreenCustomIcon(this.icon, this.val, {Key? key}) : super(key: key);

  @override
  State<SearchScreenCustomIcon> createState() => _SearchScreenCustomIconState();
}

class _SearchScreenCustomIconState extends State<SearchScreenCustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
         var x = await Navigator.push(context,
            MaterialPageRoute(
              builder: (BuildContext context) => ProfileScreen()
          ));
         x != null ? widget.val = x : widget.val = widget.val;
         setState((){});
        },
        child: Stack(
            children: [
              Container(
                height: 60,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2)
                ),
                alignment: Alignment.center,
                child: Icon(Icons.person, color: Colors.white),
              ),
              Positioned(
                top: 27,
                left: 15,

                child: Container(
                  height: 32,
                  width: 12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.add, size: 10),
                ),
              ),
              Positioned(
                  top: 50,
                  child: Text(widget.val, style: TextStyle(color: Colors.white, fontSize: 10)))
            ]
        ),
      ),
    );
  }
}

class SearchScreenTrendingSearch extends StatelessWidget {
  String val;
  SearchScreenTrendingSearch(this.val, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.double_arrow_outlined, color: Colors.white, size: 12),
        SizedBox(width: 5),
        Text(val, style: TextStyle(fontSize: 10, color: Colors.white))
      ],
    );
  }
}

class BottomCustomBar extends StatelessWidget {
  int pageNumber;
  BottomCustomBar(this.pageNumber, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.05,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //SizedBox(width: 80),
    //       Material(
    //         color: Colors.transparent,
    //         child: InkWell(
    //         onTap: () {
    //               pageNumber==0 ? () {} : Navigator.popUntil(context, ModalRoute.withName('/'));
    //               },
    //         child: Icon(pageNumber==0 ? Icons.home : Icons.home_outlined,
    //             color: Colors.white)
    //       )
    // ),
          Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    pageNumber==69 ? () {} : Navigator.popUntil(context, ModalRoute.withName('/')
                    // pageNumber==69 ? () {} : Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Users())
                    );
                  },
                  child: Icon(pageNumber==69 ? Icons.person: Icons.perm_identity,
                      color: Colors.white)
              )
          )


          //SizedBox(width: 88),
          //Icon(Icons.search, color: Colors.white),
          //SizedBox(width: 90),
      // Material(
      //   color: Colors.transparent,
      //   child: InkWell(
      //       onTap: () {},
      //       child: Icon(Icons.person, color: Colors.white)),
      // )
        ],
      ),
    );
  }
}

class CircularClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    required this.shadow,
    required this.clipper,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



