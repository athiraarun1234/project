import 'package:flutter/material.dart';
import 'package:petadoptionapp/loginpage/loginpage.dart';
import 'package:petadoptionapp/profile/firstprofile/editprofile.dart';
import 'package:petadoptionapp/profile/firstprofile/help/help.dart';
import 'package:petadoptionapp/profile/firstprofile/myorders/myorders.dart';

import 'package:petadoptionapp/profile/firstprofile/myself/myself.dart';
import 'package:petadoptionapp/profile/firstprofile/privacy/privacy.dart';
import 'package:petadoptionapp/profile/firstprofile/privacy/securitypolicy/securitypolicy.dart';
import 'package:petadoptionapp/profile/firstprofile/profilesetting.dart';

class Myprofilepage extends StatefulWidget {
  const Myprofilepage({super.key});

  @override
  State<Myprofilepage> createState() => _MyprofilepageState();
}

class _MyprofilepageState extends State<Myprofilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
           Stack(
            clipBehavior: Clip.none,
            children: [
             Container(
              height: 170,
              width: double.infinity,
              decoration:BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage('assets/front (2).png'),fit: BoxFit.cover)),
             ),
             Positioned(
              top: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Myself(),));
                },
                child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/lady.png'),
                             ),
              ))
            ],
           ),
            SizedBox(
              height: 35,
            ),
            Samplecontainer(Icons.person,'Edit profile',Icons.arrow_forward_ios_rounded,(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myprofile(),));
            }),
            SizedBox(
              height: 25,
            ),
            Samplecontainer(Icons.settings,'Settings',Icons.arrow_forward_ios_rounded,(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myprofilesetting(),),);
            }),
            SizedBox(
              height: 25,
            ),
            Samplecontainer(Icons.shop,'My Orders',Icons.arrow_forward_ios_rounded,(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myorders(),),);
            }),
            SizedBox(
              height: 25,
            ),
            Samplecontainer(Icons.help,'Help',Icons.arrow_forward_ios_rounded,(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myhelp(),),);
            }),
             SizedBox(
              height: 25,
            ),
            Samplecontainer(Icons.privacy_tip,'Privacy policy',Icons.arrow_forward_ios_rounded,(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Security(),),);
            }),
            SizedBox(height: 35,),
           
          ],
      ),),
    );
  }
  Widget Samplecontainer(IconData icon,String name,IconData icons,Function() onTap)
  {
      return Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 249, 215, 215).withOpacity(0.5),borderRadius: BorderRadius.circular(30)
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icon),
              Text(name,style: TextStyle(color: Colors.brown,fontSize: 15,fontWeight: FontWeight.normal),),
              GestureDetector(
                onTap: onTap,
                  
                child: Icon(icons))
            ],
          ),
         );
  }
}
