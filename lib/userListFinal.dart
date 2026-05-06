import 'package:flutter/material.dart';

import 'Samin/profile_screen.dart';
import 'admission/models.dart';
import 'widgets.dart';

class Users extends StatefulWidget {
  int follower=844;
  Users([this.follower=844]);
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.5) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 520.0,
            width: Curves.easeInOut.transform(value) * 520.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(),
              ),
            ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage('assets/images/samin_profile.png'),
                      height: 570,
                      width: 500,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _movieSelector(index);
                  }
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomCustomBar(1),
    )
    );
  }
}