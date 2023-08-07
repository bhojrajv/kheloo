import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kheloo/constant/Appcolor.dart';
import 'package:kheloo/model/carosoulmodel.dart';
import 'package:kheloo/util/mediasize.dart';
import 'package:kheloo/view/Commonappbar.dart';
import 'package:kheloo/view/Commonbottomnav.dart';
import 'package:kheloo/view/Corousal.dart';
import 'package:kheloo/view/Games.dart';
import 'package:kheloo/view/Socialmedia.dart';
import 'package:kheloo/view/Users.dart';
import 'package:kheloo/viewmodel/Applocalization.dart';
import 'package:kheloo/viewmodel/carsoule.dart';

class Homewdget extends StatefulWidget {
  const Homewdget({Key? key}) : super(key: key);

  @override
  State<Homewdget> createState() => _HomewdgetState();
}

class _HomewdgetState extends State<Homewdget> {
  List<Widget> bannerListCard = [];
  bool flag=false;
  List<Carousalmodel> bannerImages=[];
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Appcolor.txtwhite,Appcolor.btnyellowcolor],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  int _seconds = 0;
  Timer? _timer;
  double height=0;
  double width=0;
 late AppLocalizations2 localizations;
  @override
  void initState() {
    fetchimg();
    // TODO: implement initState

    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    startTimer();
    localizations= AppLocalizations2.of(context)??AppLocalizations2(Locale("en"));
    debugPrint("localization::::${AppLocalizations.of(context)}");
    super.didChangeDependencies();
  }
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }
  void fetchimg()async{
    getimage().then((value){
      setState(() {
        bannerImages=value;
        for (var i in bannerImages) {
          bannerListCard.add(CarosousalWdg(image: i.image),);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    height=mediaQuerysz(context: context).height;
    width=mediaQuerysz(context: context).width;
    String timerText = _seconds.toString().padLeft(7, '0');
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Align(
             alignment: Alignment.topCenter,
            child: Container(
              height: 95,
               width: mediaQuerysz(context: context).width,
               color: Appcolor.appbarcolor,
               child:CommnAppbar(onclick: (){},localizations2: localizations,linearGradient: linearGradient),
            ),
          ),
           Positioned(
             top: mediaQuerysz(context: context).height*.116,
             child: Container(
               color: Appcolor.appbarcolor,
                height:  height,
                width:  width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyCrousel(cardHeight:  mediaQuerysz(context:context ).height/2.5, childrenForCrousel: bannerListCard,),
                       Container(
                         decoration: BoxDecoration(
                             color: Appcolor.lngcolor.shade600,
                           shape: BoxShape.rectangle,
                           border: Border.symmetric(horizontal: BorderSide(width: 4,
                            color: Colors.orange))
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             SizedBox(width: mediaQuerysz(context: context).width*.08,),
                             InkWell(onTap: (){
                               localizations= AppLocalizations2.of(context)??AppLocalizations2(Locale("en"));
                               setState(() {

                               });
                             },
                                 child: Text("English",style: TextStyle(color: Appcolor.btnyellowcolor,fontSize: 16.0),)),
                             SizedBox(width: mediaQuerysz(context: context).width*.06,),
                             InkWell(
                               onTap: (){
                                 debugPrint("hindi::::");
                                 localizations= AppLocalizations2.of(context)??AppLocalizations2(Locale("hi"));
                                 setState(() {

                                 });
                               },
                                 child: Text("हिंदी",style: TextStyle(color: Appcolor.btnyellowcolor,fontSize: 16.0),))
                           ],
                         ),
                         width: mediaQuerysz(context: context).width,
                         height: mediaQuerysz(context: context).height*.09,
                       ),
                       SizedBox(height: mediaQuerysz(context: context).height*.08,),
                    Stack(alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        DottedBorder(
                           strokeWidth: 2,
                          radius: Radius.circular(20.0),
                          padding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                          color: Appcolor.countercolor.shade600,
                          borderType: BorderType.RRect,
                          child: Container(
                            alignment: Alignment.center,
                          height: mediaQuerysz(context: context).height*.095,
                          width: mediaQuerysz(context: context).width*.65,
                         child: Text("\u{20B9} ${timerText.split("").join(" ")}",style: TextStyle(fontSize: 35,
                         fontWeight: FontWeight.bold,color: Appcolor.countercolor.shade700),),
                         decoration: BoxDecoration(
                             color: Colors.orange,
                           borderRadius: BorderRadius.circular(20)
                         ),
                        ),
                        ),
                        Positioned(bottom: 80,
                            child: Image.asset('assets/jkpt2.jpg',width: 100,height: 40,fit: BoxFit.cover,)),
                      ],
                    ),
                      SizedBox(height: mediaQuerysz(context: context).height*.03,),
                      Text("${localizations.getcash}",style: TextStyle(fontSize: 40,
                      foreground: Paint()..shader=linearGradient,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      Container(height: 5,color: Appcolor.btnyellowcolor,width: mediaQuerysz(context: context)
                        .width/2.2,),
                      SizedBox(height: mediaQuerysz(context: context).height*.04,),
                      Userlist(),
                      SizedBox(height: mediaQuerysz(context: context).height*.04,),
                      Socilamediaplayer(),
                      SizedBox(height: mediaQuerysz(context: context).height*.02,),
                      Text("${localizations.getGms}",style: TextStyle(fontSize: 40,
                          foreground: Paint()..shader=linearGradient,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),

                      Container(height: 5,color: Appcolor.btnyellowcolor,width: mediaQuerysz(context: context)
                          .width/2.2,),
                      SizedBox(height: mediaQuerysz(context: context).height*.04,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${localizations.getMostpl}(8)",style: TextStyle(fontSize: 20,
                                color: Appcolor.txtwhite,fontWeight: FontWeight.w600),),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                flag=!flag;
                              });
                            }, child: Text(flag==false?"${localizations.getmore}":"${localizations.gethide}",style: TextStyle(fontSize: 12.0,color: Appcolor.txtwhite),
                            textAlign: TextAlign.center,),
                                style: ButtonStyle(
                                   alignment: Alignment.center,
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                                    fixedSize: MaterialStateProperty.all(Size(mediaQuerysz(context: context).width/3.5,
                                        mediaQuerysz(context: context).height*.06 )),
                                    backgroundColor: MaterialStateProperty.all(Appcolor.btnyellowcolor)
                                ))
                          ],
                        ),
                      ),
                      Gameslist(flag: flag,),
                      SizedBox(height: mediaQuerysz(context: context).height*.32,),
                    ],
                  ),
                ),
              ),
           ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:mediaQuerysz(context: context).height*.135 ,
              width: mediaQuerysz(context: context).width,
              color: Appcolor.appbarcolor,
              child:CommonBottomnav(localizations2: localizations,),
            ),
          )
        ],
      ),
    );
  }
}
