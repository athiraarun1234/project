import 'package:flutter/material.dart';
import 'package:petadoptionapp/APIINTEGRATION/API/api.dart';
import 'package:petadoptionapp/APIINTEGRATION/MODEL/model.dart';
import 'package:petadoptionapp/APIINTEGRATION/MODEL/model.dart';
import 'package:petadoptionapp/FAVORITEAPI/APIFAVORITE/api.dart';
import 'package:petadoptionapp/adoptionlist/ADOPTIONLISTAPI/MODELADOPTION/APIADOPTION/api.dart';
import 'package:petadoptionapp/adoptionlist/myadoption.dart';
import 'package:petadoptionapp/colors.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';
import 'package:petadoptionapp/wishlist/wishlist.dart';
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
     final favour=Provider.of<PetfavoriteProvider>(context);
     final adopt=Provider.of<AdoptionProvider>(context);
      final user=Provider.of<ProfilePetsProvider>(context);
      final detaildata=Provider.of<Petprovider>(context);

     final petdata= Provider.of<Petprovider>(context).pets.firstWhere((element) => element.petid== widget.id);
     final size=MediaQuery.of(context).size;
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
              height:size.height* 0.300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                image: DecorationImage(image:NetworkImage(petdata.photo),fit: BoxFit.cover)
              ),
            ),SizedBox(height:size.height* 0.020,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(petdata.name,style: TextStyle(color: Colors.brown,fontSize: 30,fontWeight: FontWeight.bold),),
                IconButton(onPressed: ()async
                 {
                  favour.addItemToFavourites(petid:petdata.petid.toString(),userid:user.currentUserId.toString() ); 
                  await Navigator.push(context,MaterialPageRoute(builder: (context)=>Mywishlist()));
                }, icon:Icon(Icons.favorite_border))
              ],
            ),SizedBox(height:size.height*0.020,),
            Row(
              children: [
                Container(
                  height:size.height*0.065,
                  width:size.width* 0.30,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 243, 218, 226),
                  ),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(petdata.breed,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),),
                  )),
                ), 
                SizedBox(width: size.width*0.01,),
                Container(
                  height:size.height*0.065,
                  width:size.width* 0.30,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 207, 224, 174).withOpacity(0.5),
                  ),
                  child: Center(child: Text(petdata.age,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ),SizedBox(width: 10,),
                Container(
                 height:size.height*0.065,
                  width:size.width* 0.30,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 198, 237, 252).withOpacity(0.5)),
                 child: Center(child: Text(petdata.sex,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ),
              ],
            ),
            SizedBox(height:size.height* 0.020,),
           Text(petdata.behaviour,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w100),),
          SizedBox(height:size.height* 0.020,),
           Text(petdata.addeddate),
            SizedBox(height:size.height* 0.030,),
           Center(
             child: ElevatedButton(onPressed: ()async
              {
               adopt.addAdoptPet(
                userid: user.currentUserId,
                petid: petdata.petid.toString()
               );
await Navigator.push(context,MaterialPageRoute(builder: 
(context)=>Myadoption()));
             },
              child:Text('Adopt Now')),
           )
          ],
        ),
      ),
    );
  }
}