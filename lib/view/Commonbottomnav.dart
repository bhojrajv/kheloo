import 'package:flutter/material.dart';
import 'package:kheloo/constant/Appcolor.dart';
import 'package:kheloo/util/mediasize.dart';
import 'package:kheloo/viewmodel/Applocalization.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class CommonBottomnav extends StatelessWidget {
  final AppLocalizations2 localizations2;
  const CommonBottomnav({required this.localizations2,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShapeOfView(
          width: mediaQuerysz(context: context).width/3.9,
           child: Container(
             height:mediaQuerysz(context: context).height*.135,width:mediaQuerysz(context: context).width/3.9,
             color: Appcolor.bottomnavcolor,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Image.asset('assets/loudspeaker.png',width: 40,height: 40,fit: BoxFit.cover,),
                 Text("${localizations2.getsuprt}",style: TextStyle(color: Appcolor.txtwhite,fontSize: 15.0),)
               ],
             ),
           ),
           shape:  DiagonalShape(
        position: DiagonalPosition.Right,
        direction: DiagonalDirection.Right,
        angle: DiagonalAngle.deg(angle: 15)
    ),
        ),
     Stack(
       fit: StackFit.loose,
       clipBehavior: Clip.none,alignment: Alignment.topCenter,
       children: [
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.sports_rugby_outlined,size: 40,color: Appcolor.btnyellowcolor,),
                   Text("${localizations2.getsp}",textAlign: TextAlign.start,style: TextStyle(color: Appcolor.txtwhite,fontSize: 15.0),)
                 ],
                ),
               SizedBox(width: mediaQuerysz(context: context).width*.09,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.casino,size: 40,color: Appcolor.btnyellowcolor,),
                    Text("${localizations2.getcasino}",textAlign: TextAlign.end,style: TextStyle(color: Appcolor.txtwhite,fontSize: 15.0),)
                  ],
                )
              ],
            ),
         Positioned(
          bottom: mediaQuerysz(context: context).height*.12,
           child: Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
               color: Appcolor.btnyellowcolor,),
             height: 40,width: 40,
             child: Icon(Icons.add,size: 20,),
           ),
         ),
       ],
     ),
        ShapeOfView(
          width: mediaQuerysz(context: context).width/4.2,
          child: Container(
            height:mediaQuerysz(context: context).height*.135,width:mediaQuerysz(context: context).width/4.2,
            color: Appcolor.bottomnavcolor,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Icon(Icons.perm_contact_calendar_outlined,size: 40,color: Appcolor.txtwhite,),
                Text("${localizations2.getreg}",textAlign: TextAlign.center,style: TextStyle(color: Appcolor.txtwhite,fontSize: 15.0),)
              ],
            ),
          ),
          shape:  DiagonalShape(
              position: DiagonalPosition.Left,
              direction: DiagonalDirection.Left,
              angle: DiagonalAngle.deg(angle: 15)
          ),
        )
      ],
    );
  }
}
