import 'package:flutter/material.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';

class Petwidgets extends StatefulWidget {
  final  String  petid;
 final  String  name;
 final  String  species;
 final  String  breed;
 final  String  age;
 final  String  sex;
 final  String  color;
 final  String  weight;
 final  String  dob;
 final  String  microchipid;
 final  String  aid;
 final  String  diet;
 final  String  behaviour;
 final  String  status;
 final  String  notes;
 final  String  addeddate;
 final  String  photo;
  const Petwidgets({
    super.key,
     required this.petid,
      required this.name,
      required this.species,
      required this.breed,
      required this.age,
      required this.sex,
      required this.color,
      required this.weight,
      required this.dob,
      required this.microchipid,
      required this.aid,
      required this.diet,
      required this.behaviour,
      required this.status,
      required this.notes,
      required this.addeddate,
      required this.photo,
    });

  @override
  State<Petwidgets> createState() => _PetwidgetsState();
}

class _PetwidgetsState extends State<Petwidgets> {
  @override
  Widget build(BuildContext context) {
    return 
       Column(mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           GestureDetector(
                            onTap:() {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Mydetailpage(id: widget.petid),));
                            },
                             child: Container(
                              height: 130,
                              width: 200,
                              decoration: BoxDecoration(color: Colors.brown.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image:NetworkImage(widget.photo),fit: BoxFit.cover)
                              ),
                             child:Column(
                                             children: [Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                      IconButton(
                                                   style: IconButton.styleFrom(
                                                      backgroundColor: Colors.white),
                                                   onPressed: () {},
                                                   icon: Icon(
                                                     Icons.favorite_border_outlined,
                                                     color: Colors.red
                                                   )
                                                      )
                                               ],
                                             ),                
                                             ],
                                           )
                             ),
                           ),
                           Container(
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.name,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.breed,style: TextStyle(color: Colors.black87,fontSize: 13,fontWeight: FontWeight.normal),),
                                    Text(widget.sex,style: TextStyle(color: Colors.black87,fontSize: 13,fontWeight: FontWeight.normal),),
                                  ],
                                ),
                               
                              ],
                            ),
                           )
                         ],
                       );
    
  }
}