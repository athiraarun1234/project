import 'package:flutter/material.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
           SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                          color:  const Color.fromARGB(255, 239, 198, 185),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Join Pet loveers ',style: TextStyle(color: Colors.brown,fontSize: 22,
                              fontWeight: FontWeight.bold
                              ),),
                              Text(' Community',style: TextStyle(color: Colors.brown,fontSize: 22,
                              fontWeight: FontWeight.bold
                              ),),
                               Text('We are building friends circle who love pet',style: TextStyle(color: Colors.brown,fontSize: 12,
                              fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 10,),
                              Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(color: const Color.fromARGB(255, 143, 189, 224),
                                borderRadius: BorderRadius.circular(20)),
                                child: Center(child: Text('Join',style: TextStyle(color: Colors.white,fontSize: 20)),)
                              )
                            ],
                          ),
                        ),
                      ),
                       Container(
                        height: 200,
                        width: 195,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                          color:  const Color.fromARGB(255, 239, 198, 185),
                          image: DecorationImage(image: AssetImage('assets/front-3.png'),scale: 1)
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text('Categories',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    Container(
                      height: 120,
                      child: ListView.builder(scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 75,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.brown.withOpacity(0.5)
                            ),
                            child: Image.asset('assets/dogcat.jpg'),
                          ),
                        );
                      },),
                    )
                  ],
                )
        ],
      ),
    );
  }
}