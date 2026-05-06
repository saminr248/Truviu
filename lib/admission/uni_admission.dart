import 'package:flutter/material.dart';
import '../widgets.dart';
import 'admission_foreign.dart';
class UniAdmission extends StatefulWidget {
  int follower=844;
  UniAdmission([this.follower=844]);

  @override
  State<UniAdmission> createState() => _UniAdmissionState();
}

class _UniAdmissionState extends State<UniAdmission> {
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
              Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FAdmission()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      height: 300,
                      width: 400,
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
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://scontent.xx.fbcdn.net/v/t1.15752-9/286212243_393979742759652_4288761982126479486_n.png?_nc_cat=106&ccb=1-7&_nc_sid=aee45a&_nc_ohc=iSXVA5oMKNwAX9LmiMO&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVIgKXZm635l6IAZTJEAEf8DJq6sG9U2WEtnm8AuIuzcUw&oe=62D6E942'),
                        ),
                      ),
                    ),
                  ),
                ),
              Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      height: 300,
                      width: 400,
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
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://scontent.xx.fbcdn.net/v/t1.15752-9/281874496_435390491478076_9111829038004059784_n.png?_nc_cat=109&ccb=1-7&_nc_sid=aee45a&_nc_ohc=YSMB_pLRRmwAX9fiAGD&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVI-L27ns87QHIyWCGnD1TS6hh1uRNfFJV02RKAOXDypNg&oe=62D6A7A9'),
                        ),
                      ),
                    ),
                  ),
                )
              ]

      );
        }),
          bottomNavigationBar: BottomCustomBar(1),
        )
    );
  }
}