import 'package:flutter/material.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  List<String>image=['assets/pup.png','assets/littlecat.png','assets/fish.png','assets/birds.png','assets/rabbit.png'];
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)
                      ),
                      hintText: 'Search',hintStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.search_outlined),
                      fillColor: Colors.white.withOpacity(0.5),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color:  const Color.fromARGB(255, 239, 198, 185),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text('Join Pet lovers ',style: TextStyle(color: Colors.brown,fontSize: 22,
                          fontWeight: FontWeight.bold
                          ),),
                          Text(' Community',style: TextStyle(color: Colors.brown,fontSize: 22,
                          fontWeight: FontWeight.bold
                          ),),
                           Text('We are building friends circle who love pet',style: TextStyle(color: Colors.brown,fontSize: 10,
                          fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                            onPressed: (){}, child:Text('Join',style: TextStyle(color: Colors.white),))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Image.asset('assets/front-3.png',scale: 4,),
                        )
                        
                      
                      ],
                    ),
                  ),
                 
                  Text('Categories',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
                  Container(
                    height: 120,
                    child: ListView.builder(scrollDirection: Axis.horizontal,
                    itemCount: image.length,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Mydogcataegory(),));
                          },
                          child: Container(
                            height: 105,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.brown.withOpacity(0.5),
                              image: DecorationImage(image: AssetImage(image[index],),fit: BoxFit.cover)
                            ),
                          ),
                        ),
                      );
                    },),
                  ),
                  Text('Popular pets near you',style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 0.9
                    ),
                    itemCount: 8,
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Mydetailpage()));
                              },
                               child: Container(
                                height: 130,
                                width: 200,
                                decoration: BoxDecoration(color: Colors.brown.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage(images[index]),fit: BoxFit.cover)
                                ),
                               child:Column(
                      children: [Row(
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
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(name[index],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(place[index],style: TextStyle(color: Colors.black87,fontSize: 13,fontWeight: FontWeight.normal),),
                                     
                                    ],
                                  ),
                                 
                                ],
                              ),
                             )
                           ],
                         ),
                       );
                     },),
                  )
          ],
        ),
      ),
    );
  }
}