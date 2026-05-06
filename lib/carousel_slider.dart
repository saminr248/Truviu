import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:truviu_bvp/Samin/sample_title_page_3.dart';
import 'package:truviu_bvp/admission/models.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          itemCount: movies.length,
          options: CarouselOptions(
              height: 400,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
          ),
          itemBuilder: (context, index, realIndex){
            final urlImage = movies[index].imageUrl;
            return buildImage(urlImage, index);
          },
        ),
      ),
    );
  }
  Widget buildImage(String urlImage, int index) => GestureDetector(
    onTap: () => movies[index].title == 'Pedo Samin' ? Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Carousel(),
      ),
    )
        : Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TestTitle3(),
        ),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urlImage),
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
