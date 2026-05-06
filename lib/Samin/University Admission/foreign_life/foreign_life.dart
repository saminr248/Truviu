import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:truviu_bvp/Samin/University%20Admission/foreign_life/furnitures/furnitures.dart';
import 'package:truviu_bvp/Samin/University%20Admission/foreign_life/health_insurance/health_insurance.dart';
import 'package:truviu_bvp/Samin/University%20Admission/foreign_life/sim_cards/sim_cards.dart';
import 'package:truviu_bvp/widgets.dart';
import 'package:truviu_bvp/Samin/University%20Admission/foreign_life/courses/video_player_courses.dart';

class ForeignLife extends StatefulWidget {
  const ForeignLife({Key? key}) : super(key: key);

  @override
  State<ForeignLife> createState() => _ForeignLifeState();
}

class _ForeignLifeState extends State<ForeignLife> {
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
                  SizedBox(width: MediaQuery.of(context).size.width*0.28),
                  Column(
                    children: [
                      // SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      Container(
                        height: 85,
                        width: 85,
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
                            image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660237356150.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Text('Life Abroad is... tough',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.015),
                      // Text('Life Is a Struggle',
                      //   style: TextStyle(
                      //       color: Colors.grey[700],
                      //       fontSize: 13
                      //   ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Row(
                        children: [
                          Text('by Samin Rahman',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),),
                          SizedBox(width: MediaQuery.of(context).size.width*0.009),
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660166198984.jpg'),
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
              SizedBox(width: 40),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CoursesVideoScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 150,
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660231001439.png'),
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Furnitures()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 150,
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660231023856.jpg'),
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
              SizedBox(width: 40),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HealthInsurance()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 150,
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660231041988.png'),
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SimCards()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 150,
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660231071882.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: 10),
          // Row(
          //   children: [
          //     SizedBox(width: 117),
          //     Material(
          //       color: Colors.transparent,
          //       child: InkWell(
          //         onTap: () {
          //           // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle4()));
          //         },
          //         child: Container(
          //           margin: EdgeInsets.all(2),
          //           height: 200,
          //           width: 150,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(.5),
          //                 spreadRadius: 5,
          //                 blurRadius: 7,
          //                 offset: Offset(0, 3),
          //               ),
          //             ],
          //             image: DecorationImage(
          //               fit: BoxFit.fill,
          //               image: AssetImage('assets/images/health_insurance.png'),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //   ],
          // )

        ],
      ),

      bottomNavigationBar: BottomCustomBar(2),
    )
    );
  }
}

