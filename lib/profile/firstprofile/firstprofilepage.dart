import 'package:flutter/material.dart';
import 'package:petadoptionapp/profile/firstprofile/myprofile.dart';
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
              child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/lady.png'),
             ))
            ],
           ),
            SizedBox(
              height: 55,
            ),
            Samplecontainer(Icons.person,'Profile Details',Icons.arrow_forward_ios_rounded,(){
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myprofilesetting(),),);
            }),
            SizedBox(
              height: 25,
            ),
            Samplecontainer(Icons.help,'Help',Icons.arrow_forward_ios_rounded,(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myprofilesetting(),),);
            }),
          ],
        ),
      ),
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
