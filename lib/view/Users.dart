import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kheloo/constant/Appcolor.dart';
import 'package:kheloo/model/Usermodel.dart';
import 'package:kheloo/util/mediasize.dart';

class Userlist extends StatefulWidget {
  const Userlist({Key? key}) : super(key: key);

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  List<Usermodeldata>userdata=[];
  @override
  void initState() {
    // TODO: implement initState
    userdata.add(Usermodeldata(name: "raj",price: "2393", time: "2 second ago",));
    userdata.add(Usermodeldata(name: "rahul",price: "5593", time: "6 second ago",));
    userdata.add(Usermodeldata(name: "Ajay",price: "66393", time: "10 second ago",));
    userdata.add(Usermodeldata(name: "Vijay",price: "99999", time: "12 second ago",));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        alignment: Alignment.center,
        width:mediaQuerysz(context: context).width ,
        decoration: BoxDecoration(color: Appcolor.lngcolor.shade700,
            borderRadius: BorderRadius.circular(10.0),border: Border.all(width: 4,color: Appcolor.btnyellowcolor)),
        height: mediaQuerysz(context: context).height/4.5,
        child: GridView.builder(itemBuilder: (context,index){
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 4,color: Appcolor.btnyellowcolor),
                  borderRadius: BorderRadius.circular(30,)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.person,size: 30,color: Appcolor.txtwhite,),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${userdata[index].name?.toUpperCase()} ",style: TextStyle(color: Appcolor.txtwhite,
                      fontSize: 15),),
                      Text("\u{20B9} ${userdata[index].price}",style: TextStyle(color: Appcolor.txtwhite,
                          fontSize: 15)),
                    ],
                  ),
                  Text("${userdata[index].time}",style: TextStyle(color: Appcolor.txtwhite,
                      fontSize: 12)),
                ],
              )
            ],
          );
        }, itemCount: userdata.length,shrinkWrap: true,scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
         childAspectRatio: .5)),
      ),
    );
  }
}
