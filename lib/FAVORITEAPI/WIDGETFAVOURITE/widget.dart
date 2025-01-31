import 'package:flutter/material.dart';
import 'package:petadoptionapp/FAVORITEAPI/APIFAVORITE/api.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';
import 'package:provider/provider.dart';

class Myfavoritewidgets extends StatefulWidget {
   final String favId;
 final String petid;
 final String name;
 final String species;
 final String breed;
 final String age;
 final String sex;
 final  String color;
 final  String weight;
 final  String dob;
 final String microchipid;
 final  String aid;
 final String diet;
 final String behaviour;
 final  String status;
 final String notes;
 final String addeddate;
 final String photo;

  const Myfavoritewidgets({
    super.key,
    required  this.favId,
      required  this.petid,
      required  this.name,
      required  this.species,
      required  this.breed,
      required  this.age,
      required  this.sex,
      required  this.color,
      required  this.weight,
      required  this.dob,
     required   this.microchipid,
      required  this.aid,
      required  this.diet,
      required  this.behaviour,
      required  this.status,
      required  this.notes,
      required  this.addeddate,
      required  this.photo
    });

  @override
  State<Myfavoritewidgets> createState() => _MyfavoritewidgetsState();
}

class _MyfavoritewidgetsState extends State<Myfavoritewidgets> {
  @override
  Widget build(BuildContext context) {
     final favorite=Provider.of<PetfavoriteProvider>(context);
   
    return 
              Column(
                children: [
                  Container(
                    height: 180,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                       image: DecorationImage(image: NetworkImage(widget.photo,),fit: BoxFit.cover)
                    ),
                    child:Column(
                      children: [Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child:IconButton(onPressed: ()
                             {
                          favorite.deleteFav(widget.favId, context);
                            }, icon:Icon(Icons.close)))
                        ],
                      ),                
                      ],
                    )
                          ),
                          Container(
                            height: 65,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name:${widget.name}',style: TextStyle(fontSize: 15,color: Colors.brown),),
                                 Text('Breed:${widget.breed}',style: TextStyle(fontSize: 11),),
                               
                              ],
                            ),
                          )
                ],
              );
          
  }
}