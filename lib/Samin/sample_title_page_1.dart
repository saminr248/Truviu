import 'package:flutter/material.dart';

import '../admission/models.dart';
import '../admission/test.dart';
import '../widgets.dart';

class TestTitle1 extends StatefulWidget {
  const TestTitle1({Key? key}) : super(key: key);

  @override
  State<TestTitle1> createState() => _TestTitle1State();
}

class _TestTitle1State extends State<TestTitle1> {
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
                builder: (_) => MovieScreen(movie: movies[index]),
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
              Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new,)),
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  Column(
                    children: [
                      // SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      Container(
                        height: 100,
                        width: 100,
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
                      Text('Which Ugly Stage of Life Are You in Right Now?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.008),
                      Text('Life Is a Struggle',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13
                        ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      Row(
                        children: [
                          Text('by Samin Rahman',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),),
                          SizedBox(width: MediaQuery.of(context).size.width*0.009),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage('http://139.162.60.60/images/image_1657916391818.jpg'),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
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

