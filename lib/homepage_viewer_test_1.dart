import 'dart:math';
import 'package:flutter/material.dart';

import 'Samin/High School/I_am_in_hs.dart';
import 'Samin/University Admission/i_am_in_university_test_2.dart';
import 'Samin/sample_title_page_2.dart';
import 'Samin/sample_title_page_5.dart';


class UserViewer extends StatefulWidget {
  @override
  _UserViewerState createState() => _UserViewerState();
}

class _UserViewerState extends State<UserViewer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 0,
      child: TabBarView(
          controller: _tabController,
          children: [
            CreditCard(size: size),
            SAT(size: size),
            TestTitle3(size: size),
          ]
      ),
    );
  }
}

class TestTitle3 extends StatefulWidget {
  final Size size;
  const TestTitle3({Key? key, required this.size}) : super(key: key);

  @override
  State<TestTitle3> createState() => _TestTitle3State();
}
class _TestTitle3State extends State<TestTitle3> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
    quarterTurns: 0,
    child: Container(
      height: widget.size.height,
      width: widget.size.width,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  // Material(
                  //   color: Colors.transparent,
                  //   child: InkWell(
                  //       onTap: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Icon(Icons.arrow_back_ios_new,)),
                  // ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.13),
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
                                image: AssetImage('assets/images/title_logo.png'),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02),
                          Text('Which Stage of Life Are You in Now?',
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
                                    image: NetworkImage('http://13.213.0.96/images/image_1658878126682.jpg'),
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InHS()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InUniversity2()));
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
          );
        },
      ),
    )
    );
  }
}

class SAT extends StatefulWidget {
  final Size size;
  const SAT({Key? key, required this.size}) : super(key: key);

  @override
  State<SAT> createState() => _SATState();
}
class _SATState extends State<SAT> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 0,
     child: Container(
       height: widget.size.height,
       width: widget.size.width,
       child: ListView.builder(
         itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
           return Column(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                   // Material(
                   //   color: Colors.transparent,
                   //   child: InkWell(
                   //       onTap: () {
                   //         Navigator.pop(context);
                   //       },
                   //       child: Icon(Icons.arrow_back_ios_new,)),
                   // ),
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
                                 image: NetworkImage('https://ibigcsehometuition.com/img/sat2.png'),
                               ),
                             ),
                           ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.02),
                           Text('One Score to Rule Them All',
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
                                     image: NetworkImage('http://13.213.0.96/images/image_1658878126682.jpg'),
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
                   SizedBox(width: 20),
                   Material(
                     color: Colors.transparent,
                     child: InkWell(
                       onTap: () {
                         // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Grades()));
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
                             image: AssetImage('assets/images/SAT_1.png'),
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
                         // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InHS()));
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
                             image: AssetImage('assets/images/SAT_2.png'),
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
                         // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InUniversity2()));
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
                             image: AssetImage('assets/images/SAT_3.png'),
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
                         // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle5()));
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
                             image: AssetImage('assets/images/SAT_4.png'),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ],
           );
        },
      ),
    )
    );
  }
}

class CreditCard extends StatefulWidget {
  final Size size;
  const CreditCard({Key? key, required this.size}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}
class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 0,
      child: Container(
        height: widget.size.height,
        width: widget.size.width,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  // Material(
                  //   color: Colors.transparent,
                  //   child: InkWell(
                  //       onTap: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Icon(Icons.arrow_back_ios_new,)),
                  // ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.13),
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
                                image: NetworkImage('https://scontent.xx.fbcdn.net/v/t1.15752-9/293079803_5689811104440923_2574151384493155809_n.png?_nc_cat=103&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Ybix86tUd7YAX9s2gU_&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKhHa8_4EB-0kbpPbuuh1myt3sOxxJ633v8z_obaOqgKw&oe=6317062A'),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02),
                          Text('Plastic Card = Free Money and Security',
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
                                    image: NetworkImage('http://13.213.0.96/images/image_1658878126682.jpg'),
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
                  SizedBox(width: 20),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Grades()));
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
                            image: AssetImage('assets/images/cc_1.png'),
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
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InHS()));
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
                            image: AssetImage('assets/images/cc_2.png'),
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
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InUniversity2()));
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
                            image: AssetImage('assets/images/cc_3.png'),
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
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle5()));
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
                            image: AssetImage('assets/images/cc_4.png'),
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
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InUniversity2()));
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
                            image: AssetImage('assets/images/cc_5.png'),
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
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle5()));
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
                            image: AssetImage('assets/images/cc_6.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    )
    );
  }
}


