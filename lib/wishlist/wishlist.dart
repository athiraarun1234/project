import 'package:flutter/material.dart';

class Mywishlist extends StatefulWidget {
  const Mywishlist({super.key});

  @override
  State<Mywishlist> createState() => _MywishlistState();
}

class _MywishlistState extends State<Mywishlist> {
  List<String>breed=['shetzu','catty','rabbi','bird','pomer','catty','fish','bird'];
  List<String>images=['assets/pup.png','assets/littlecat.png','assets/rabbit.png',
  'assets/dove.jpg','assets/dog3.png','assets/cat1.png','assets/fish.png','assets/birds.png',];
  List<String>name=['Rooby','Lalli','Kaathu','whityy','Silky','Oreo','Goldenfish','Birds'];
   List<String>place=['Tvm','Kollam','Vithura','Ullor','Pattom','CRP','Veiloor','Attingal'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
        mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 0.7,
        ),
        itemCount: 8,
         itemBuilder: (context, index) {
          return
              Column(
                children: [
                  Container(
                  
                    height: 180,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                       image: DecorationImage(image: AssetImage(images[index],),fit: BoxFit.cover)
                    ),
                    child:Column(
                      children: [Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.close)
                        ],
                      ),                
                      ],
                    )
                          ),
                          Container(
                            height: 65,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name:${name[index]}',style: TextStyle(fontSize: 11),),
                                 Text('Breed:${breed[index]}',style: TextStyle(fontSize: 11),),
                                Row(
                                  children: [
                                    Icon(Icons.place),
                                    Text(place[index],style: TextStyle(fontSize: 11),),
                                  ],
                                )
                              ],
                            ),
                          )
                ],
              );
          
        },),
      )
    );
  }
}