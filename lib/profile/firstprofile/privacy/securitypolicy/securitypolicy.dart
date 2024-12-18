import 'package:flutter/material.dart';
import 'package:petadoptionapp/loginpage/loginpage.dart';
import 'package:petadoptionapp/profile/firstprofile/privacy/privacy.dart';
import 'package:petadoptionapp/profile/firstprofile/privacy/securityprivacy/securityprivacy.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 231, 225),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Privacy and Data Usage',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Myprivacy(),));
                },
                child: Icon(Icons.arrow_forward_ios_sharp))
            ],
          ),
          SizedBox(height: 20,),

           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Security and Privacy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mysecurity(),));
                },
                child: Icon(Icons.arrow_forward_ios_sharp))
             ],
           ),
        ],
      ),
    );
  }
}