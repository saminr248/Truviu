import 'package:flutter/material.dart';

import '../admission/models.dart';
import '../widgets.dart';
import 'sample_title_page_3.dart';

class TestTitle2 extends StatefulWidget {
  const TestTitle2({Key? key}) : super(key: key);

  @override
  State<TestTitle2> createState() => _TestTitle2State();
}

class _TestTitle2State extends State<TestTitle2> {
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
          value = (1 - (value.abs() * 0.25) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 350.0,
            width: Curves.easeInOut.transform(value) * 300.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TestTitle3(),
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
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        // height: 220.0,
                        // width: 400.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   left: 30.0,
            //   bottom: 40.0,
            //   child: Container(
            //     width: 250.0,
            //     child: Text(
            //       movies[index].title.toUpperCase(),
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new,)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.32),
                  Text('Samin Rahman',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),),
                  SizedBox(width: MediaQuery.of(context).size.width*0.02),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('http://139.162.60.60/images/image_1657916391818.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.25),
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.001),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/title_logo.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Text('Which Ugly Stage of Life',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),),
                      Text('Are You in Right Now?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03),
                      Text('Life Is a Struggle',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13
                        ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Divider(
                thickness: 5,
              )
            ],
          ),
          Container(
            height: 350,
            width: double.infinity,
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

      bottomNavigationBar: BottomCustomBar(2),
    )
    );
  }
}

