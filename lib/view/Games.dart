import 'package:flutter/cupertino.dart';
import 'package:kheloo/constant/Appcolor.dart';
import 'package:kheloo/model/Gamesmodel.dart';
import 'package:kheloo/util/mediasize.dart';

class Gameslist extends StatefulWidget {
  final bool flag;
  const Gameslist({required this.flag,Key? key}) : super(key: key);

  @override
  State<Gameslist> createState() => _GameslistState();
}

class _GameslistState extends State<Gameslist> {
  List<GameModels>gmlist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gmlist.add(GameModels(image:'assets/gm.jpg',minpr: '100',mxpr: '10k' ));
    gmlist.add(GameModels(image:'assets/gm2.jpg',minpr: '100',mxpr: '20k' ));
    gmlist.add(GameModels(image:'assets/gm3.jpg',minpr: '100',mxpr: '30k' ));
    gmlist.add(GameModels(image:'assets/gm4.jpg',minpr: '100',mxpr: '40k' ));
    gmlist.add(GameModels(image:'assets/gm5.jpg',minpr: '100',mxpr: '50k' ));
    gmlist.add(GameModels(image:'assets/gm6.jpg',minpr: '100',mxpr: '60k' ));
    gmlist.add(GameModels(image:'assets/gm7.jpg',minpr: '100',mxpr: '70k' ));
    gmlist.add(GameModels(image:'assets/gm8.jpg',minpr: '100',mxpr: '80k' ));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      childAspectRatio: 16/14,crossAxisSpacing: 8,mainAxisSpacing: 8),
          itemBuilder: (context,index){
           return Padding(
             padding: const EdgeInsets.all(4.0),
             child: Container(
               decoration: BoxDecoration(
                   border: Border.all(width: 2,color: Appcolor.btnyellowcolor),
                   borderRadius: BorderRadius.circular(15,)
               ),
               child: Stack(
                 fit: StackFit.loose,
                 clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                 children: [
                   Container(
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                         child: Image.asset("${gmlist[index].image}",fit: BoxFit.cover,
                         height: mediaQuerysz(context: context).height/5,)),
                   ),
                   Container(
                    decoration: BoxDecoration(
                      color: Appcolor.appstatusbar.shade400,
                      borderRadius: BorderRadius.circular(10)
                    ),
                     height: 30,
                     width: mediaQuerysz(context: context).width/2.2,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Min \u{20B9}${gmlist[index].minpr}",style: TextStyle(color: Appcolor.txtwhite,fontSize: 15),),
                        SizedBox(width:  mediaQuerysz(context: context).width*.03,),
                         Container(height: mediaQuerysz(context: context).height*.04,width: 2,
                           color: Appcolor.btnyellowcolor,),
                         SizedBox(width:  mediaQuerysz(context: context).width*.03,),
                         Text("Max \u{20B9}${gmlist[index].mxpr}",style: TextStyle(color: Appcolor.txtwhite,fontSize: 15),),
                       ],
                     ),),
                 ],
               ),
             ),
           );
          },itemCount:widget.flag==false? gmlist.length-4:gmlist.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
    );
  }
}
