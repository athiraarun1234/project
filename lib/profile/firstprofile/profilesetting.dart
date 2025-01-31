import 'package:flutter/material.dart';
import 'package:petadoptionapp/profile/firstprofile/reviewpage/reviewpage.dart';

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
      body: Column(//crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Privacy policy',style: TextStyle(color: Colors.brown,fontSize: 15,fontWeight: FontWeight.bold),),
              ElevatedButton(onPressed: () {
                
              }, child: Text('On')),
            ],
          ),
         // Image.asset('assets/privacys.png')
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('Review',style: TextStyle(color: Colors.brown,fontSize: 15,fontWeight: FontWeight.bold),),
             GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>Myreviewpage() ,));
              },
              child: Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.brown,))
           ],
         )
        ],
      ),
       
    );
  }
}