import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kheloo/model/carosoulmodel.dart';

Future<List<Carousalmodel>>getimage()async{
  final image  =   await rootBundle.loadString("assets/carosoul.json");
   List<Carousalmodel>listimg=[];
   var jsonimg=jsonDecode(image);
      for( var img in jsonimg['images']){
        listimg.add(Carousalmodel(image:img['image'] ));
      }
      print('image:${listimg.first.image}');
  return  listimg;
}