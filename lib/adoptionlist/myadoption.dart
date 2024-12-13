import 'package:flutter/material.dart';

class Myadoption extends StatefulWidget {
  const Myadoption({super.key});

  @override
  State<Myadoption> createState() => _MyadoptionState();
}

class _MyadoptionState extends State<Myadoption> {
  List<String>image=['assets/pup.png','assets/littlecat.png',
  'assets/rabbit.png','assets/dog3.png',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 197, 188),
        title: Text('My Adoption List',style: TextStyle(color: Colors.brown),),
      ),
      body:ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber
            ),
          ),
        );
      },)
    );
  }
}