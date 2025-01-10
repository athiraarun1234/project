import 'package:flutter/material.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';

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
    return 
              Column(
                children: [
                  Container(
                    height: 180,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                       image: DecorationImage(image: NetworkImage(widget.photo,),fit: BoxFit.cover)
                    ),
                    child:Column(
                      children: [Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.close)
                        ],
                      ),                
                      ],
                    )
                          ),
                          Container(
                            height: 65,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name:${widget.name}',style: TextStyle(fontSize: 11),),
                                 Text('Breed:${widget.breed}',style: TextStyle(fontSize: 11),),
                                Row(
                                  children: [
                                    Icon(Icons.date_range),
                                    Text(widget.addeddate,style: TextStyle(fontSize: 11),),
                                  ],
                                )
                              ],
                            ),
                          )
                ],
              );
          
  }
}