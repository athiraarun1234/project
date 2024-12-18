import 'package:flutter/material.dart';

class Myadoption extends StatefulWidget {
  const Myadoption({super.key});

  @override
  State<Myadoption> createState() => _MyadoptionState();
}

class _MyadoptionState extends State<Myadoption> {
  List<String>image=['assets/catty.png','assets/goldfish.png','assets/dogs.png',];
   List<String>name=['catty','goldfish','dogy',];
   List<String>breed=['cat','fish', 'dog',];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 197, 188),
        title: Text('My Adoption List',style: TextStyle(color: Colors.brown),),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(image[index]),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name[index]),
                    Text(breed[index]),
                    ElevatedButton(onPressed: () {  
                    }, child: Text('Pending'))
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