import 'package:flutter/material.dart';
import 'package:petadoptionapp/APIINTEGRATION/API/api.dart';
import 'package:petadoptionapp/APIINTEGRATION/MODEL/model.dart';
import 'package:petadoptionapp/APIINTEGRATION/MODEL/model.dart';
import 'package:petadoptionapp/colors.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
import 'package:provider/provider.dart';

class Mydetailpage extends StatefulWidget {
  static const routname='detailscreen';
  final String id;
  const Mydetailpage({super.key,
  required this.id});

  @override
  State<Mydetailpage> createState() => _MydetailpageState();
}

class _MydetailpageState extends State<Mydetailpage> {
  @override
  Widget build(BuildContext context) {
     final petdata= Provider.of<Petprovider>(context).pets.firstWhere((element) => element.petid== widget.id);
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Mynavigationbar(),));
      },
        child: Icon(Icons.arrow_back,color: Colors.brown,)),
      title: Text('Petdetails',style: TextStyle(color: Colors.brown,fontSize: 22),),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                image: DecorationImage(image:NetworkImage(petdata.photo),fit: BoxFit.cover)
              ),
            ),SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(petdata.name,style: TextStyle(color: Colors.brown,fontSize: 30,fontWeight: FontWeight.bold),),
                Icon(Icons.favorite_border,color: Colors.red,size: 35,)
              ],
            ),SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 45,
                  width: 95,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 243, 218, 226),
                  ),
                  child: Center(child: Text(petdata.breed,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ), 
                SizedBox(width: 10,),
                Container(
                  height: 45,
                  width: 135,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 207, 224, 174).withOpacity(0.5),
                  ),
                  child: Center(child: Text(petdata.age,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ),SizedBox(width: 10,),
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 198, 237, 252).withOpacity(0.5)),
                 child: Center(child: Text(petdata.sex,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ),
              ],
            ),
            SizedBox(height: 20,),
           Text(petdata.behaviour,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w100),),
           SizedBox(height: 10,),
           Text(petdata.addeddate),
           SizedBox(height: 35,),
           Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(color:const Color.fromARGB(255, 243, 79, 20).withOpacity(0.4),borderRadius: BorderRadius.circular(35)),
            child: Center(child: Text('Adopt Now',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
           )
          ],
        ),
      ),
    );
  }
}