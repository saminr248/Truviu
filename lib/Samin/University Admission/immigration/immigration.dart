import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:truviu_bvp/Samin/University%20Admission/immigration/immi_sub/immi_sub.dart';
import 'package:truviu_bvp/Samin/University%20Admission/immigration/video_player_i94.dart';
import 'package:truviu_bvp/Samin/University%20Admission/immigration/video_player_reportuni.dart';
import 'package:truviu_bvp/widgets.dart';

class Immigration extends StatefulWidget {
  const Immigration({Key? key}) : super(key: key);

  @override
  State<Immigration> createState() => _ImmigrationState();
}

class _ImmigrationState extends State<Immigration> {
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
                  SizedBox(width: MediaQuery.of(context).size.width*0.07),
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
                            image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660238665986.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Text('Why Does Immigrating Feel Like A Crime?',
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ImmiSub()));
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660235038106.jpg'),
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ReportUniVideoScreen()));
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660235063871.jpg'),
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
              SizedBox(width: 117),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => I94VideoScreen()));
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660235086747.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(width: 3),
              // Material(
              //   color: Colors.transparent,
              //   child: InkWell(
              //     onTap: () {
              //       // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle5()));
              //     },
              //     child: Container(
              //       margin: EdgeInsets.all(2),
              //       height: 200,
              //       width: 150,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(.5),
              //             spreadRadius: 5,
              //             blurRadius: 7,
              //             offset: Offset(0, 3), // changes position of shadow
              //           ),
              //         ],
              //         image: DecorationImage(
              //           fit: BoxFit.cover,
              //           image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660231071882.jpg'),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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

