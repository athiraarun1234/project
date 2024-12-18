import 'package:flutter/material.dart';

class Myorders extends StatefulWidget {
  const Myorders({super.key});

  @override
  State<Myorders> createState() => _MyordersState();
}

class _MyordersState extends State<Myorders> {
  List<String>image=['assets/pomer.png','assets/goldfish.png','assets/dogs.png',];
   List<String>name=['catty','goldfish','dogy',];
   List<String>breed=['cat','fish', 'dog',];
   List<String>date=['12/04/2024','21/05/2024','13/06/2024'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 197, 188),
        title: Text('My orders',style: TextStyle(color: Colors.brown),),
      ),
      body:ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,

            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image[index],scale:8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Name:${name[index]}'),
                    Text('Breed:${breed[index]}'),
                    Container(
                      height: 60,
                      width: 105,
                      decoration: BoxDecoration(color: Colors.amberAccent),
                      child: Column(
                        children: [
                          Text('Delivered Date:'),
                          Text(date[index]),
                        ],
                      ))
                  ],
                )
              ],
            ),
          ),
        );
      },)
    );
  }
}