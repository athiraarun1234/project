import 'package:flutter/material.dart';
import 'package:petadoptionapp/loginpage/loginpage.dart';

class Myregisterpage extends StatefulWidget {
  const Myregisterpage({super.key});

  @override
  State<Myregisterpage> createState() => _MyregisterpageState();
}

class _MyregisterpageState extends State<Myregisterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 198, 185),
       body:Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/front.png'),
          //fit: BoxFit.cover
          )),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Your Account',style: TextStyle(color: const Color.fromARGB(255, 180, 71, 24),
                fontSize: 27,fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                    ),
                    hintText: 'Name',hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.person),
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
                    hintText: 'Phone',hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.phone),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                  ),
                ), SizedBox(height: 25,), 
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
                ),  SizedBox(height: 25,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                    ),
                    hintText: 'Password',hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                  ),
                ),  SizedBox(height: 25,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                    ),
                    hintText: 'Address',hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.place),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                  ),
                ), 
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Myloginpage(),));
                  },
                  child: Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),  
                    ),
                    child: Center(child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],
             ),
           ),
          ),
    );
  }
}