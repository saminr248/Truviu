import 'package:flutter/material.dart';

import '../widgets.dart';
import 'america.dart';
import 'australia.dart';
import 'canada.dart';
import 'hong_kong.dart';
import 'japan.dart';

class FAdmission extends StatefulWidget {
  int follower=844;
  FAdmission([this.follower=844]);

  @override
  State<FAdmission> createState() => _FAdmissionState();
}

class _FAdmissionState extends State<FAdmission> {
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
          SizedBox(height: 20),
          Row(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Canada()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(3),
                    height: 200,
                    width: 190,
                    child: Hero(
                     tag: 'Canada',
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                       child: Image(
                         image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1920px-Flag_of_Canada_%28Pantone%29.svg.png'),
                         fit: BoxFit.fill
                       ),
                     ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      // image: DecorationImage(
                      //   fit: BoxFit.fill,
                      //   image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1920px-Flag_of_Canada_%28Pantone%29.svg.png'),
                      // ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Japan()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 200,
                    width: 190,
                    child: Hero(
                      tag: 'Japan',
                      child: Image(
                          image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1920px-Flag_of_Japan.svg.png'),
                          fit: BoxFit.fill
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      // image: DecorationImage(
                      //   fit: BoxFit.fill,
                      //   image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1920px-Flag_of_Japan.svg.png'),
                      // ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 3),
          Row(
          children: [
          Material(
          color: Colors.transparent,
          child: InkWell(
          onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => America()));
          },
          child: Container(
          margin: EdgeInsets.all(3),
          height: 200,
          width: 190,
            child: Hero(
              tag: 'USA',
              child: Image(
                  image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1920px-Flag_of_the_United_States.svg.png'),
                  fit: BoxFit.fill
              ),
            ),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
          ),
          ],
          // image: DecorationImage(
          // fit: BoxFit.fill,
          // image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1920px-Flag_of_the_United_States.svg.png'),
          // ),
          ),
          ),
          ),
          ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HongKong()));
                },
                child: Container(
                  margin: EdgeInsets.all(2),
                  height: 200,
                  width: 190,
                  child: Hero(
                    tag: 'HK',
                    child: Image(
                        image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Hong_Kong.svg/1920px-Flag_of_Hong_Kong.svg.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    // image: DecorationImage(
                    //   fit: BoxFit.fill,
                    //   image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Hong_Kong.svg/1920px-Flag_of_Hong_Kong.svg.png'),
                    // ),
                  ),
                ),
              ),
            ),
          ]

          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Australia()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      height: 200,
                      width: 190,
                      child: Hero(
                        tag: 'Australia',
                        child: Image(
                            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1920px-Flag_of_Australia_%28converted%29.svg.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        // image: DecorationImage(
                        //   fit: BoxFit.fill,
                        //   image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1920px-Flag_of_Australia_%28converted%29.svg.png'),
                        // ),
                      ),
                    ),
                  ),
                ),

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