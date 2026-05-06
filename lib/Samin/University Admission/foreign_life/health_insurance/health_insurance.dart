import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:truviu_bvp/Samin/High%20School/I_am_in_hs.dart';
import 'package:truviu_bvp/Samin/University%20Admission/foreign_life/health_insurance/video_player_insurance.dart';
import 'package:truviu_bvp/Samin/University%20Admission/foreign_life/health_insurance/video_player_shit_insurance.dart';
import 'package:truviu_bvp/admission/models.dart';
import 'package:truviu_bvp/widgets.dart';

class HealthInsurance extends StatefulWidget {
  const HealthInsurance({Key? key}) : super(key: key);

  @override
  State<HealthInsurance> createState() => _HealthInsuranceState();
}
class _HealthInsuranceState extends State<HealthInsurance> {
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
                  SizedBox(width: MediaQuery.of(context).size.width*0.24),
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
                            image: CachedNetworkImageProvider('http://13.229.103.9:3000/images/image_1660237528181.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Text("America's Worst Invention",
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
          Center(
            child: CarouselSlider.builder(
              itemCount: hid.length,
              options: CarouselOptions(
                height: 400,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIndex){
                final urlImage = hid[index].imageUrl;
                return buildImage(urlImage, index);
              },
            ),
          ),
          // Row(
          // children: [
          // SizedBox(width: 20),
          // Material(
          // color: Colors.transparent,
          // child: InkWell(
          // onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle2()));
          // },
          // child: Container(
          // margin: EdgeInsets.all(2),
          // height: 200,
          // width: 170,
          // decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          // BoxShadow(
          // color: Colors.grey.withOpacity(.5),
          // spreadRadius: 5,
          // blurRadius: 7,
          // offset: Offset(0, 3),
          // ),
          // ],
          // image: DecorationImage(
          // fit: BoxFit.cover,
          // image: AssetImage('assets/images/title_folder_1.png'),
          // ),
          // ),
          // ),
          // ),
          // ),
          // SizedBox(width: 3),
          // Material(
          // color: Colors.transparent,
          // child: InkWell(
          // onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InHS()));
          // },
          // child: Container(
          // margin: EdgeInsets.all(2),
          // height: 200,
          // width: 170,
          // decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          // BoxShadow(
          // color: Colors.grey.withOpacity(.5),
          // spreadRadius: 5,
          // blurRadius: 7,
          // offset: Offset(0, 3), // changes position of shadow
          // ),
          // ],
          // image: DecorationImage(
          // fit: BoxFit.cover,
          // image: AssetImage('assets/images/title_folder_2.png'),
          // ),
          // ),
          // ),
          // ),
          // ),
          // ],
          // ),
          // SizedBox(height: 10),
          // Row(
          // children: [
          // SizedBox(width: 20),
          // Material(
          // color: Colors.transparent,
          // child: InkWell(
          // onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InUniversity2()));
          // },
          // child: Container(
          // margin: EdgeInsets.all(2),
          // height: 200,
          // width: 170,
          // decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          // BoxShadow(
          // color: Colors.grey.withOpacity(.5),
          // spreadRadius: 5,
          // blurRadius: 7,
          // offset: Offset(0, 3),
          // ),
          // ],
          // image: DecorationImage(
          // fit: BoxFit.cover,
          // image: AssetImage('assets/images/title_folder_3.png'),
          // ),
          // ),
          // ),
          // ),
          // ),
          // SizedBox(width: 3),
          // Material(
          // color: Colors.transparent,
          // child: InkWell(
          // onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle5()));
          // },
          // child: Container(
          // margin: EdgeInsets.all(2),
          // height: 200,
          // width: 170,
          // decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          // BoxShadow(
          // color: Colors.grey.withOpacity(.5),
          // spreadRadius: 5,
          // blurRadius: 7,
          // offset: Offset(0, 3), // changes position of shadow
          // ),
          // ],
          // image: DecorationImage(
          // fit: BoxFit.cover,
          // image: AssetImage('assets/images/title_folder_4.png'),
          // ),
          // ),
          // ),
          // ),
          // ),
          // ],
          // ),
        ],
      ),

      bottomNavigationBar: BottomCustomBar(2),
    )
    );
  }
  Widget buildImage(String urlImage, int index) => GestureDetector(
    onTap: () => hid[index].title == 'Pedo Samin' ? Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InsuranceVideoScreen(),
      ),
    )
        : Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ShitInsuranceVideoScreen(),
      ),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(urlImage),
            fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      // color: Colors.grey,
      // child: Image.network(
      //   urlImage,
      //   fit: BoxFit.cover,
      // ),
    ),
  );
}

class HealthInsuranceData {
  String imageUrl;
  String title;
  String categories;
  int year;
  String country;
  int length;
  String description;
  List<String> screenshots;

  HealthInsuranceData({
    required this.imageUrl,
    required this.title,
    required this.categories,
    required this.year,
    required this.country,
    required this.length,
    required this.description,
    required this.screenshots,
  });
}

final List<HealthInsuranceData> hid = [
  HealthInsuranceData(
    imageUrl: 'http://13.229.103.9:3000/images/image_1660232632432.png',
    title: 'Pedo Samin',
    categories: 'Fantasy, Sci-fi',
    year: 2018,
    country: 'USA',
    length: 129,
    description:
    'Our friendly neighborhood Super Hero decides to join his best friends Ned, MJ, and the rest of the gang on a European vacation. However, Peter\'s plan to leave super heroics behind for a few weeks are quickly scrapped when he begrudgingly agrees to help Nick Fury uncover the mystery of several elemental creature attacks, creating havoc across the continent.',
    screenshots: [
      'assets/images/spiderman_0.jpg',
      'assets/images/spiderman_1.jpg',
      'assets/images/spiderman_2.jpg',
    ],
  ),
  HealthInsuranceData(
    imageUrl: 'http://13.229.103.9:3000/images/image_1660232654658.png',
    title: 'King Tajwar',
    categories: 'Adventure, Family, Fantasy',
    year: 2018,
    country: 'USA',
    length: 100,
    description:
    'All Clara wants is a key - a one-of-a-kind key that will unlock a box that holds a priceless gift from her late mother. A golden thread, presented to her at godfather Drosselmeyer\'s annual holiday party, leads her to the coveted key-which promptly disappears into a strange and mysterious parallel world. It\'s there that Clara encounters a soldier named Phillip, a gang of mice and the regents who preside over three Realms: Land of Snowflakes, Land of Flowers, and Land of Sweets. Clara and Phillip must brave the ominous Fourth Realm, home to the tyrant Mother Ginger, to retrieve Clara\'s key and hopefully return harmony to the unstable world.',
    screenshots: [
      'assets/images/nutcracker_0.jpg',
      'assets/images/nutcracker_1.jpg',
      'assets/images/nutcracker_2.jpg',
    ],
  ),

  // Movie(
  //   imageUrl: 'assets/images/title_folder_3.png',
  //   title: 'Loser Faiaz',
  //   categories: 'Adventure, Fantasy',
  //   year: 2019,
  //   country: 'USA',
  //   length: 100,
  //   description:
  //   'Woody, Buzz Lightyear and the rest of the gang embark on a road trip with Bonnie and a new toy named Forky. The adventurous journey turns into an unexpected reunion as Woody\'s slight detour leads him to his long-lost friend Bo Peep. As Woody and Bo discuss the old days, they soon start to realize that they\'re two worlds apart when it comes to what they want from life as a toy.',
  //   screenshots: [
  //     'assets/images/toystory_0.jpg',
  //     'assets/images/toystory_1.jpg',
  //     'assets/images/toystory_2.jpg',
  //   ],
  // ),
  // Movie(
  //   imageUrl: 'assets/images/title_folder_4.png',
  //   title: 'Loser Faiaz',
  //   categories: 'Adventure, Fantasy',
  //   year: 2019,
  //   country: 'USA',
  //   length: 100,
  //   description:
  //   'Woody, Buzz Lightyear and the rest of the gang embark on a road trip with Bonnie and a new toy named Forky. The adventurous journey turns into an unexpected reunion as Woody\'s slight detour leads him to his long-lost friend Bo Peep. As Woody and Bo discuss the old days, they soon start to realize that they\'re two worlds apart when it comes to what they want from life as a toy.',
  //   screenshots: [
  //     'assets/images/toystory_0.jpg',
  //     'assets/images/toystory_1.jpg',
  //     'assets/images/toystory_2.jpg',
  //   ],
  // ),
];