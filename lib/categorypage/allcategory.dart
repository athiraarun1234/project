import 'package:flutter/material.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';

class Mycategorypage extends StatefulWidget {
  const Mycategorypage({super.key});

  @override
  State<Mycategorypage> createState() => _MycategorypageState();
}

class _MycategorypageState extends State<Mycategorypage> {
  List<String>image=['assets/pup.png','assets/littlecat.png','assets/fish.png','assets/birds.png','assets/rabbit.png'];
  List<String>petname=['Dog','Cat','Fish','Bird','Rabbit'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories',style: TextStyle(color: Colors.brown,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 0.7),
                itemCount: 5,
                 itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Mydogcataegory(),));
                        },
                        child: Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(color: const Color.fromARGB(255, 152, 89, 66).withOpacity(0.5),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                          image: DecorationImage(image: AssetImage(image[index]),fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        width:350 ,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 244, 234, 234).withOpacity(0.5),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
                        ),
                      child: Center(child: Text(petname[index],style: TextStyle(color: Colors.brown,fontWeight: FontWeight.normal,fontSize: 20),)),
                      )
                    ],
                  );
                },
                ),
            )
          ],
        ),
      ),
    );
  }
}