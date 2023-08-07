import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kheloo/constant/Appcolor.dart';
import 'package:kheloo/util/mediasize.dart';
import 'package:kheloo/viewmodel/Applocalization.dart';

class CommnAppbar extends StatelessWidget {
  final Shader linearGradient;
  final AppLocalizations2 localizations2;
  final Function onclick;
  const CommnAppbar({required this.linearGradient,required this.localizations2,required this.onclick,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
         padding: EdgeInsets.only(top: mediaQuerysz(context: context).height*.035,left: 20),
          child: Text("${localizations2.gettitle}",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,
              foreground: Paint()..shader=linearGradient,fontWeight: FontWeight.w600),),
        ),
      ElevatedButton(onPressed: (){
        onclick();
      }, child: Text("${localizations2.getlogin}",style: TextStyle(fontSize: 20.0,color: Appcolor.txtwhite),),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.only(top: mediaQuerysz(context: context).width*.075)),
             alignment: Alignment.center,
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
        fixedSize: MaterialStateProperty.all(Size(mediaQuerysz(context: context).width/3.5,
            mediaQuerysz(context: context).height/3.5 )),
         backgroundColor: MaterialStateProperty.all(Appcolor.btnyellowcolor)
      ))
      ],
    );
  }
}
