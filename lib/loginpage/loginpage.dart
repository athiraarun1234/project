import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:petadoptionapp/Registerpage/registerpage.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:petadoptionapp/loginpage/forgetpassword/forgetpassword.dart';
import 'package:http/http.dart'as http;
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/model.dart';
import 'package:provider/provider.dart';


class Myloginpage extends StatefulWidget {
  const Myloginpage({super.key});

  @override
  State<Myloginpage> createState() => _MyloginpageState();
}

class _MyloginpageState extends State<Myloginpage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
   final formkey=GlobalKey<FormState>();
   late bool isclick;
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
            List user = jsonData['userDetails'];
          if (user.isNotEmpty) {
            UserDetails userdata = UserDetails.fromJson(user[0]);
            String userId = userdata.userid;
            Provider.of<ProfilePetsProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }


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
  void initState() {
    isclick=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
  final size=MediaQuery.of(context).size;
    return Scaffold (
      backgroundColor: const Color.fromARGB(255, 239, 198, 185),
      body: Form(
        key: formkey,
        child: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/front.png'),
            //fit: BoxFit.cover
            )),
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Find a new ',style: TextStyle(color: const Color.fromARGB(255, 180, 71, 24),
                  fontSize: 30,fontWeight: FontWeight.bold),),
                    Text(' Friend!!',style: TextStyle(color: const Color.fromARGB(255, 180, 71, 24),
                  fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height:size.height*0.01),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
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
                  SizedBox(height: size.height*0.025,),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: isclick,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                      ),
                      hintText: 'Password',hintStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon:IconButton(onPressed: (){
                        setState(() {
                          isclick=!isclick;
                        });
                      }, icon: Icon(isclick?Icons.visibility:Icons.visibility_off)),
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
                  ), SizedBox(height:size.height*0.01),
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
                  
                  SizedBox(height:size.height*0.04),
                  GestureDetector(
                    onTap: () {
                     if(formkey.currentState!.validate())
                     {
                      loginapi( emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
                     }
                    },
                    child: Container(
                      height: size.height*0.07,
                      width:size.width*0.45,
                      decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),  
                      ),
                      child: Center(child: Text('LOGIN',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                    ),
                  ),SizedBox(height:size.height*0.025,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an Account?',style: TextStyle(color: const Color.fromARGB(255, 51, 12, 25),fontSize: 15,
                      fontWeight: FontWeight.bold),),
                      SizedBox(width:size.width*0.030,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Myregisterpage(),));
                        },
                        child: Text('Register',style: TextStyle(color:const Color.fromARGB(255, 167, 101, 9),fontSize: 18,
                        fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )
                ],
               ),
             ),
            ),
      ),
    );
  }
}