import 'package:flutter/material.dart';

import '../widgets.dart';

class America extends StatefulWidget {
  int follower=844;
  America([this.follower=844]);

  @override
  State<America> createState() => _AmericaState();
}

class _AmericaState extends State<America> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index){

            return Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context, 'Samin');
                            },
                            child: Icon(Icons.arrow_back_ios_new)),
                      ),
                      Text('littolsamin', style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.share)
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage('https://scontent.xx.fbcdn.net/v/t1.15752-9/266280285_648381143266935_3213646958469119900_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=aee45a&_nc_ohc=m0EpTPyUZ1MAX-XAEMl&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVJl3lFkJA7qMMzb94q1YHJ7E5w_pHv0lFpBzSrR2rMPVA&oe=62CCEA9C'),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 17),
                          Text('Samin Rahman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          Row(
                            children: [
                              Text('Content creator obsessing over tech & startups',
                                  style: TextStyle(fontSize: 12)),
                              Icon(Icons.business_center, size: 16, color: Colors.brown)
                            ],
                          ),
                          Row(
                            children: [
                              Text('University of Texas, Dallas\'23',
                                  style: TextStyle(fontSize: 12)),
                              Icon(Icons.book_rounded, size: 15, color: Colors.blue)
                            ],
                          ),
                          Text('www.youtube.com/SaminRahmanBhaiya',
                              style: TextStyle(fontSize: 12)),
                          Row(
                            children: [
                              SizedBox(width: 50),
                              Column(
                                children: [
                                  ElevatedButton(onPressed: () {
                                    print('You Followed Me');
                                    setState((){
                                      widget.follower += 1;
                                    });
                                  },
                                      child: Text('Follow', style: TextStyle(color: Colors.black)),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade200),
                                        fixedSize: MaterialStateProperty.all(Size.fromWidth(150)),
                                        side: MaterialStateProperty.all(BorderSide(
                                            color: Colors.yellow.shade100,
                                            width: 1
                                        )),
                                      )
                                  ),
                                  Text('${widget.follower} Followers',
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 100),
                  Container(
                    transform: Matrix4.translationValues(0, -50, 0),
                    child: Hero(
                        tag: 'USA',
                        child: ClipShadowPath(
                          clipper: CircularClipper(),
                          shadow: Shadow(blurRadius: 20),
                          child: Image(
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1920px-Flag_of_the_United_States.svg.png'),
                          ),
                        )

                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Why USA?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('USA Scholarships', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Jobs while studying', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Career after studying', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),



                ]
            );
          }),
      bottomNavigationBar: BottomCustomBar(1),
    )
    );
  }
}
