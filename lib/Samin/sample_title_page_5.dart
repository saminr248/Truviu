import 'package:flutter/material.dart';

import '../widgets.dart';
import 'sample_title_page_2.dart';
import 'sample_title_page_3.dart';
import 'sample_title_page_4.dart';

class TestTitle5 extends StatefulWidget {
  const TestTitle5({Key? key}) : super(key: key);

  @override
  State<TestTitle5> createState() => _TestTitle5State();
}

class _TestTitle5State extends State<TestTitle5> {
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
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/title_logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 5),
                      Text('Recommendation Letter Length', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                      Text('by Samin Rahman',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 12
                        ),),
                      // SizedBox(width: MediaQuery.of(context).size.width*0.009),
                      // Container(
                      //   height: 50,
                      //   width: 50,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     image: DecorationImage(
                      //       fit: BoxFit.fill,
                      //       image: NetworkImage('http://139.162.60.60/images/image_1657916391818.jpg'),
                      //     ),
                      //   ),
                      // ),
                          ]
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              color: Colors.grey,
              height: 2,
              width: MediaQuery.of(context).size.width*0.15,
            ),
          ),
          // Divider(
          //   thickness: 2,
          // ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle2()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 170,
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
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/title_folder_1.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle3()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/title_folder_2.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 20),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle4()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 170,
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
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/title_folder_3.png'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle5()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/title_folder_4.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomCustomBar(2),
    )
    );
  }
}


















