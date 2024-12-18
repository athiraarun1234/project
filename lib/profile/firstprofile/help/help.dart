import 'package:flutter/material.dart';

class Myhelp extends StatefulWidget {
  const Myhelp({super.key});

  @override
  State<Myhelp> createState() => _MyhelpState();
}

class _MyhelpState extends State<Myhelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 163, 136),
        title: Text('Help',style: TextStyle(color: Colors.brown),),
      ),
      body: Column(
        children: [
          Text('Do you have any help?',style: TextStyle(color: Colors.brown,fontSize: 17,fontWeight:FontWeight.normal),),
          SizedBox(height: 25,),
          Image(image: AssetImage('assets/helps.png')),
          ElevatedButton(onPressed: () {
            
          }, child:Text('Call us'))
        ],
      ),
    );
  }
}