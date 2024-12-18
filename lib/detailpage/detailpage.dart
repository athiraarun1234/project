import 'package:flutter/material.dart';
import 'package:petadoptionapp/colors.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:petadoptionapp/homepage/homepage.dart';

class Mydetailpage extends StatefulWidget {
  const Mydetailpage({super.key});

  @override
  State<Mydetailpage> createState() => _MydetailpageState();
}

class _MydetailpageState extends State<Mydetailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Mynavigationbar(),));
      },
        child: Icon(Icons.arrow_back,color: Colors.brown,)),
      title: Text('Petdetails',style: TextStyle(color: Colors.brown,fontSize: 22),),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                image: DecorationImage(image: AssetImage('assets/pup.png'),fit: BoxFit.cover)
              ),
            ),SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rooby',style: TextStyle(color: Colors.brown,fontSize: 30,fontWeight: FontWeight.bold),),
                Icon(Icons.favorite_border,color: Colors.red,size: 35,)
              ],
            ),SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 45,
                  width: 95,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 243, 218, 226),
                  ),
                  child: Center(child: Text('Lapsa',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ), 
                SizedBox(width: 10,),
                Container(
                  height: 45,
                  width: 135,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 207, 224, 174).withOpacity(0.5),
                  ),
                  child: Center(child: Text('1 Year',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ),SizedBox(width: 10,),
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 198, 237, 252).withOpacity(0.5)),
                 child: Center(child: Text('Female',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.brown),)),
                ),
              ],
            ),
            SizedBox(height: 20,),
           Text('The kindest Rooby we have ever met.She likes to play with balls.Is friends with other animals.Despite the white color.She love rain and puddles.',
           style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w100),),
           SizedBox(height: 10,),
           Text('Updated December 12'),
           SizedBox(height: 35,),
           Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(color:const Color.fromARGB(255, 243, 79, 20).withOpacity(0.4),borderRadius: BorderRadius.circular(35)),
            child: Center(child: Text('Adopt Now',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
           )
          ],
        ),
      ),
    );
  }
}