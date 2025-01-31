import 'package:flutter/material.dart';

class Adoptionwidget extends StatefulWidget {
  final  String orderId;
 final  String petId;
final   String userId;
final   String orderStatus;
 final  String date;
final   String name;
final   String species;
final   String breed;
 final  String age;
final   String sex;
final   String color;
final   String weight;
 final  String dob;
 final  String microchipid;
final   String diet;
 final  String behaviour;
 final  String petStatus;
final   String notes;
final   String addeddate;
final   String photo;

  const Adoptionwidget({super.key,required this.orderId,
      required this.petId,
      required this.userId,
      required this.orderStatus,
      required this.date,
      required this.name,
      required this.species,
      required this.breed,
      required this.age,
      required this.sex,
      required this.color,
      required this.weight,
      required this.dob,
      required this.microchipid,
      required this.diet,
      required this.behaviour,
      required this.petStatus,
      required this.notes,
      required this.addeddate,
      required this.photo});

  @override
  State<Adoptionwidget> createState() => _AdoptionwidgetState();
}

class _AdoptionwidgetState extends State<Adoptionwidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
         Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.photo),fit: BoxFit.cover)),
         ),
         Container(
          height: 150,
          width: 225,
          decoration: BoxDecoration(color: const Color.fromARGB(255, 239, 223, 223)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name,style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
              Text(widget.breed),
             ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 194, 165, 154)),
              onPressed: () {
               
             }, child:Text(widget.orderStatus))
                
    
            ],
          ),
         )
        ],
      ),
    );
  }
}