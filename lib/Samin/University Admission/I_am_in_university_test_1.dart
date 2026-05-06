import 'package:flutter/material.dart';

import '../../widgets.dart';
import 'i_am_in_university_test_2.dart';

class InUniversity1 extends StatefulWidget {
  const InUniversity1({Key? key}) : super(key: key);

  @override
  State<InUniversity1> createState() => _TestTitle3State();
}

class _TestTitle3State extends State<InUniversity1> {
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
              SizedBox(width: 4),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InUniversity2()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 140,
                    width: 186.67,
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
                        image: NetworkImage('https://dl2.boxcloud.com/api/2.0/internal_files/988417007952/versions/1069209495552/representations/png_paged_2048x2048/content/1.png?access_token=1!7sicxygi1KospQkxM1bCbGxpGQG8ISgptNJhgWXfPVTTBeTkDF4ZpsTAEBzR6hBuutTgbIKNzOKs_5VuYC67Vak-sH2xRI69RCQQ3ZIzOyN8N73q7fjCdAiQaXx6dtloBdn0PU_Pku-iGqWQve1yRGQclELL9qRZ74TBJ8UdhSG24ghNr06upgx_0fW3CBMdDyvUTDx7vWD2s6JUwo_dWWikCyZCN4F6NRMUxONRh9Q4CKtZlAMhHAPL-jbtd1vYo4zTregdqAkWcWc3hwpkThX6LqQ2P37U6JvJxcK7otsAVlnkNh7qnpvmhfWx-iLbGvSqKVN8D53APVTkOAdmr2NPpYoYesHvsyMCNyzEsOeYN92sBRmDhfpiRZ3PU4mF5EOiksUIT6nSToKZFQ9MZn-G8F-zRW5IBLKe9Kap--K7va5mxRGNNEOO7MsSsQT-LGdKM04M1XFQ6a-XurFSK-X_d4SVv9J169yn3-Mw4QzG6tvTH8RMA28IrCvJaoMmWkQnUitV9PQdWVT55VfFWAyH-xsOo_CZ22lf5VB6I4ZCTqvtHsDZwWKBkQBnSea-WBTj&shared_link=https%3A%2F%2Futdallas.app.box.com%2Fs%2Ft280ssqhf7naakwloknw4clip7in61yh&box_client_name=box-content-preview&box_client_version=2.85.0'),
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
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InUniversity()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 140,
                    width: 186.67,
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
                        image: NetworkImage('https://dl2.boxcloud.com/api/2.0/internal_files/988419445688/versions/1069212018488/representations/png_paged_2048x2048/content/1.png?access_token=1!7sicxygi1KospQkxM1bCbGxpGQG8ISgptNJhgWXfPVTTBeTkDF4ZpsTAEBzR6hBuutTgbIKNzOKs_5VuYC67Vak-sH2xRI69RCQQ3ZIzOyN8N73q7fjCdAiQaXx6dtloBdn0PU_Pku-iGqWQve1yRGQclELL9qRZ74TBJ8UdhSG24ghNr06upgx_0fW3CBMdDyvUTDx7vWD2s6JUwo_dWWikCyZCN4F6NRMUxONRh9Q4CKtZlAMhHAPL-jbtd1vYo4zTregdqAkWcWc3hwpkThX6LqQ2P37U6JvJxcK7otsAVlnkNh7qnpvmhfWx-iLbGvSqKVN8D53APVTkOAdmr2NPpYoYesHvsyMCNyzEsOeYN92sBRmDhfpiRZ3PU4mF5EOiksUIT6nSToKZFQ9MZn-G8F-zRW5IBLKe9Kap--K7va5mxRGNNEOO7MsSsQT-LGdKM04M1XFQ6a-XurFSK-X_d4SVv9J169yn3-Mw4QzG6tvTH8RMA28IrCvJaoMmWkQnUitV9PQdWVT55VfFWAyH-xsOo_CZ22lf5VB6I4ZCTqvtHsDZwWKBkQBnSea-WBTj&shared_link=https%3A%2F%2Futdallas.app.box.com%2Fs%2Ft280ssqhf7naakwloknw4clip7in61yh&box_client_name=box-content-preview&box_client_version=2.85.0'),
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
              SizedBox(width: 4),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle4()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 140,
                    width: 186.67,
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
                        image: NetworkImage('https://dl2.boxcloud.com/api/2.0/internal_files/988418880664/versions/1069211452264/representations/png_paged_2048x2048/content/1.png?access_token=1!KNKaPEAfeaJejdXjFk0yqU_gHoTzwL_Or9JUKIawENBuQtGQqg8GeN4ucoTd5rKjgDbRM5HEp99zxMcWWuU5N6pYq2jRTag5zKtWuBYMdXWBBZ9INs8A3ShE9tP-648rejrnkNaAr4dlYJuj2bgcUF0eQq5DSP72Rg6aPkyADHSWS9bc-aumGPjf7EH3Rt-YAYZMb9q1saF77Yx-EK5ZBa0ri_v2rXs5dCf7rt01ldcLudu5lJFH8OwXE9MvvFh-sjBQP9UeYLGoCPLqJ_ub-CmjXZ06slOwnM88mMeVz7FGyujZ5AJUZStSp9eVJrgbdmvw-f69iovOeGU16vsnlZFYuP8xOxf3cbzBCCTLgVgm6dnkYAJUYfWSGQy4HgtKvjxDz7EW03okMyFj59_axv9AAROEXPTFfPmiYOb5GyK62kdn-QnNSXFWVjUPr5LKT7c34sUFNwA0kbZGD1PEbTFoOYeC3a2DXcAq-LKq0imy_NEXvIt8HpI0Ta-Cj7Wf1CPPZAnUIPssHuMTu7sUSWvbSzIFMziXpYiW_WhbCm5FAolCm3DHMTHs1dMOevV_x-fC&shared_link=https%3A%2F%2Futdallas.app.box.com%2Fs%2Ft280ssqhf7naakwloknw4clip7in61yh&box_client_name=box-content-preview&box_client_version=2.85.0'),
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
                    height: 140,
                    width: 186.67,
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
                        image: NetworkImage('https://dl2.boxcloud.com/api/2.0/internal_files/988419547291/versions/1069212133291/representations/png_paged_2048x2048/content/1.png?access_token=1!7sicxygi1KospQkxM1bCbGxpGQG8ISgptNJhgWXfPVTTBeTkDF4ZpsTAEBzR6hBuutTgbIKNzOKs_5VuYC67Vak-sH2xRI69RCQQ3ZIzOyN8N73q7fjCdAiQaXx6dtloBdn0PU_Pku-iGqWQve1yRGQclELL9qRZ74TBJ8UdhSG24ghNr06upgx_0fW3CBMdDyvUTDx7vWD2s6JUwo_dWWikCyZCN4F6NRMUxONRh9Q4CKtZlAMhHAPL-jbtd1vYo4zTregdqAkWcWc3hwpkThX6LqQ2P37U6JvJxcK7otsAVlnkNh7qnpvmhfWx-iLbGvSqKVN8D53APVTkOAdmr2NPpYoYesHvsyMCNyzEsOeYN92sBRmDhfpiRZ3PU4mF5EOiksUIT6nSToKZFQ9MZn-G8F-zRW5IBLKe9Kap--K7va5mxRGNNEOO7MsSsQT-LGdKM04M1XFQ6a-XurFSK-X_d4SVv9J169yn3-Mw4QzG6tvTH8RMA28IrCvJaoMmWkQnUitV9PQdWVT55VfFWAyH-xsOo_CZ22lf5VB6I4ZCTqvtHsDZwWKBkQBnSea-WBTj&shared_link=https%3A%2F%2Futdallas.app.box.com%2Fs%2Ft280ssqhf7naakwloknw4clip7in61yh&box_client_name=box-content-preview&box_client_version=2.85.0'),
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
              SizedBox(width: 100),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TestTitle4()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 140,
                    width: 186.67,
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
                        image: NetworkImage('https://dl2.boxcloud.com/api/2.0/internal_files/988417972925/versions/1069210552925/representations/png_paged_2048x2048/content/1.png?access_token=1!7sicxygi1KospQkxM1bCbGxpGQG8ISgptNJhgWXfPVTTBeTkDF4ZpsTAEBzR6hBuutTgbIKNzOKs_5VuYC67Vak-sH2xRI69RCQQ3ZIzOyN8N73q7fjCdAiQaXx6dtloBdn0PU_Pku-iGqWQve1yRGQclELL9qRZ74TBJ8UdhSG24ghNr06upgx_0fW3CBMdDyvUTDx7vWD2s6JUwo_dWWikCyZCN4F6NRMUxONRh9Q4CKtZlAMhHAPL-jbtd1vYo4zTregdqAkWcWc3hwpkThX6LqQ2P37U6JvJxcK7otsAVlnkNh7qnpvmhfWx-iLbGvSqKVN8D53APVTkOAdmr2NPpYoYesHvsyMCNyzEsOeYN92sBRmDhfpiRZ3PU4mF5EOiksUIT6nSToKZFQ9MZn-G8F-zRW5IBLKe9Kap--K7va5mxRGNNEOO7MsSsQT-LGdKM04M1XFQ6a-XurFSK-X_d4SVv9J169yn3-Mw4QzG6tvTH8RMA28IrCvJaoMmWkQnUitV9PQdWVT55VfFWAyH-xsOo_CZ22lf5VB6I4ZCTqvtHsDZwWKBkQBnSea-WBTj&shared_link=https%3A%2F%2Futdallas.app.box.com%2Fs%2Ft280ssqhf7naakwloknw4clip7in61yh&box_client_name=box-content-preview&box_client_version=2.85.0'),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          )

        ],
      ),

      bottomNavigationBar: BottomCustomBar(2),
    )
    );
  }
}

