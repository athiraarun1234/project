import 'package:flutter/material.dart';

class Myprofilesetting extends StatefulWidget {
  const Myprofilesetting({super.key});

  @override
  State<Myprofilesetting> createState() => _MyprofilesettingState();
}

class _MyprofilesettingState extends State<Myprofilesetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 206, 201),
        title: Text('Settings',style: TextStyle(color:Colors.brown),),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Privacy policy',style: TextStyle(color: Colors.brown,fontSize: 15,fontWeight: FontWeight.bold),),
              ElevatedButton(onPressed: () {
                
              }, child: Text('On')),
            ],
          ),
          Image.asset('assets/privacys.png')
        ],
      ),
       
    );
  }
}