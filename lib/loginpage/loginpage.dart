import 'package:flutter/material.dart';
import 'package:petadoptionapp/Registerpage/registerpage.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:petadoptionapp/homepage/homepage.dart';

class Myloginpage extends StatefulWidget {
  const Myloginpage({super.key});

  @override
  State<Myloginpage> createState() => _MyloginpageState();
}

class _MyloginpageState extends State<Myloginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: const Color.fromARGB(255, 239, 198, 185),
      body:
          Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/front.png'),
          //fit: BoxFit.cover
          )),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Find a new ',style: TextStyle(color: const Color.fromARGB(255, 180, 71, 24),
                fontSize: 30,fontWeight: FontWeight.bold),),
                  Text(' Friend!!',style: TextStyle(color: const Color.fromARGB(255, 180, 71, 24),
                fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                    ),
                    hintText: 'Email',hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.email),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                    ),
                    hintText: 'Password',hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                  ),
                ), SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',style: TextStyle(color: const Color.fromARGB(255, 229, 100, 53),fontSize: 15,
                          fontWeight: FontWeight.bold),),
                  ],
                ),
                
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Mynavigationbar(),));
                  },
                  child: Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),  
                    ),
                    child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                  ),
                ),SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an Account?',style: TextStyle(color: const Color.fromARGB(255, 51, 12, 25),fontSize: 15,
                      fontWeight: FontWeight.bold),),
                      SizedBox(width: 30,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Myregisterpage(),));
                        },
                        child: Text('Register',style: TextStyle(color:const Color.fromARGB(255, 167, 101, 9),fontSize: 18,
                        fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                )
              ],
             ),
           ),
          ),
    );
  }
}