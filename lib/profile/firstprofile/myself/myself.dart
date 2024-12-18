import 'package:flutter/material.dart';
import 'package:petadoptionapp/profile/firstprofile/editprofile.dart';

class Myself extends StatefulWidget {
  const Myself({super.key});

  @override
  State<Myself> createState() => _MyselfState();
}

class _MyselfState extends State<Myself> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 224, 218),
        title: Text('My profile',style: TextStyle(color: Colors.brown),),
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/lady.png'),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color:Colors.white.withOpacity(0.5)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name:Athira A',style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.normal),),
                   Text('Address:Nandanam Tvm',style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.normal),),
                    Text('Email:athira@gmail.com',style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.normal),),
                     Text('Phone:6799453423',style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.normal),),
                ],
              ),
            ), 
          ),
          Text('Love and care the pets',style: TextStyle(color: const Color.fromARGB(255, 204, 159, 23),fontSize: 15),),
          Image.asset('assets/profile.png')
        ],
      ),
    );
  }
}