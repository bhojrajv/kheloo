import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kheloo/constant/Appcolor.dart';
import 'package:kheloo/util/mediasize.dart';

class CarosousalWdg extends StatelessWidget {
  final dynamic image;
  const CarosousalWdg({required this.image,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("carosoulimg:${image}");
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        width: MediaQuery.of(context).size.width,
        height: mediaQuerysz(context:context ).height/2.5,
        child: ClipRRect(borderRadius: BorderRadius.circular(0),
            child: Image.asset(image,fit: BoxFit.cover,width: mediaQuerysz(context: context).width,)),
      ),
    );;
  }
}

class MyCrousel extends StatefulWidget {
  final List<Widget> childrenForCrousel;
  final double cardHeight;
  const MyCrousel({required this.childrenForCrousel,required this.cardHeight,Key? key}) : super(key: key);

  @override
  State<MyCrousel> createState() => _MyCrouselState();
}

class _MyCrouselState extends State<MyCrousel> {
  int currnt=0;
  @override
  Widget build(BuildContext context) {
    debugPrint("mycarosoul::");
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [

        CarouselSlider(
          items: widget.childrenForCrousel,
          // items:
          //   generateQuoteList(context, screenWidth, _quotes),
          options: CarouselOptions(
            height: widget.cardHeight ,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 1.02,
            clipBehavior: Clip.none,
            pageSnapping: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
             onPageChanged: (int indx,reason){
             setState(() {
               currnt=indx;
             });
             },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Align(
         alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            color: Appcolor.appbarcolor,
            height: 80,
            width: mediaQuerysz(context: context).width,
            child: ListView.builder(itemBuilder: (context,index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                      color:currnt==index? Appcolor.btnyellowcolor:Appcolor.txtwhite,
                      alignment: Alignment.center,
                      height: 3,width: 25,
                    ),
                  ),

                ],
              );
            },itemCount: widget.childrenForCrousel.length,shrinkWrap: true,scrollDirection: Axis.horizontal),
          ),
        ),
      ],
    );
  }
}
