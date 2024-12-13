import 'package:flutter/material.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';

class Mydogcataegory extends StatefulWidget {
  const Mydogcataegory({super.key});

  @override
  State<Mydogcataegory> createState() => _MydogcataegoryState();
}

class _MydogcataegoryState extends State<Mydogcataegory> {
  List<String>dogimage=['assets/pug.jpg','assets/shetzu.png','assets/pomer.png',
  'assets/malti.png','assets/german.png','assets/boxer.png','assets/bulldog.png'];
  List<String>dogname=['Pug','Shih Tzu','Pomeranian','Maltese','German Shephard','Boxer','Bulldog'];
   List<String>placename=['Attingal','Pattam','Tvm','Kollam','Vithura','Pala','Veiloor'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => Mynavigationbar(),));
        },
          child: Icon(Icons.arrow_back,color: Colors.brown,)),
        title: Text('Dog Categories',style: TextStyle(color: Colors.brown),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 0.7,
        ), itemCount: dogimage.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mydetailpage(),));
                },
                child: Container(
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                  image: DecorationImage(image: AssetImage(dogimage[index]),fit: BoxFit.cover)),
                   child:Column(
                        children: [
                          Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                                      style: IconButton.styleFrom(
                             backgroundColor: Colors.white),
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.favorite_border_outlined,
                                                        color: Colors.red
                                                      )
                            )
                          ],
                        ),                
                        ],
                      )
                ),
              ),
             Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
                child: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dogname[index],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                     Row(crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        Icon(Icons.place),
                         Text(placename[index],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),),
                         SizedBox(width: 50,),
                       ],
                     ),
                  ],
                )),
              ),
               
            ],
          );
        },),
      ),
    );
  }
}