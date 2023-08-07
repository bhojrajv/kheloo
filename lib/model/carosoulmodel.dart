class Carousalmodel{
  String? image;
  Carousalmodel({this.image});

  Carousalmodel.fromjson(Map<dynamic,dynamic>json){
    this.image=json['image'];
  }
}