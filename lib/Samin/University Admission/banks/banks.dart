import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:truviu_bvp/Samin/University%20Admission/banks/best_bank/best_bank.dart';
import 'package:truviu_bvp/Samin/University%20Admission/banks/best_bank/video_player_bestbank.dart';
import 'package:truviu_bvp/Samin/University%20Admission/banks/video_player_mustbank.dart';
import 'package:truviu_bvp/Samin/University%20Admission/banks/video_player_openbank.dart';
import 'package:truviu_bvp/widgets.dart';

class Banks extends StatefulWidget {
  const Banks({Key? key}) : super(key: key);

  @override
  State<Banks> createState() => _BanksState();
}

class _BanksState extends State<Banks> {
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
                  SizedBox(width: MediaQuery.of(context).size.width*0.25),
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
                            image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660237867194.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Text('Bow Down To Capitalism',
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OpenBankVideoScreen()));
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660234111914.png'),
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MustBankVideoScreen()));
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660234142788.png'),
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BestBankVideoScreen()));
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
                        image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660234168446.png'),
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

