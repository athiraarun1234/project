import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petadoptionapp/Registerpage/registerpage.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
import 'package:petadoptionapp/loginpage/forgetpassword/forgetpassword.dart';
import 'package:http/http.dart'as http;


class Myloginpage extends StatefulWidget {
  const Myloginpage({super.key});

  @override
  State<Myloginpage> createState() => _MyloginpageState();
}

class _MyloginpageState extends State<Myloginpage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
   final formkey=GlobalKey<FormState>();
  Future<void>loginapi(String email, String password) async {
    
    const url =
        'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/login.php';

    Map<String, String> body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["status"]);
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber,
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  Mynavigationbar()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['status'] == false) {
          
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber,
              content: const Text(
                'Invalid phone and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: const Color.fromARGB(255, 239, 198, 185),
      body: Form(
        key: formkey,
        child: Container(
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
                    controller: emailcontroller,
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
                    validator: (value) {
                      if(emailcontroller.text.isEmpty)
                      {
                        return'Please enter the email'; 
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    controller: passwordcontroller,
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
                    validator: (value) {
                      if(passwordcontroller.text.isEmpty){
                        return'Please enter the password';
                      }
                      else{
                        return null;
                      }
                    },
                  ), SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Mypassword(),));
                        },
                        child: Text('Forgot Password?',style: TextStyle(color: const Color.fromARGB(255, 229, 100, 53),fontSize: 15,
                              fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () {
                     if(formkey.currentState!.validate())
                     {
                      loginapi( emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
                     }
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
      ),
    );
  }
}