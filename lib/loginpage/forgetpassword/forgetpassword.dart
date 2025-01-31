import 'package:flutter/material.dart';
import 'package:petadoptionapp/loginpage/loginpage.dart';

class Mypassword extends StatefulWidget {
  const Mypassword({super.key});

  @override
  State<Mypassword> createState() => _MypasswordState();
}

class _MypasswordState extends State<Mypassword> {
  @override
  Widget build(BuildContext context) {
  final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 229, 223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Create a new password',style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
               SizedBox(height:size.height*0.035),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'create a new password',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                fillColor: Colors.white.withOpacity(.5),
                filled: true,
              ),
            ),
            SizedBox(height:size.height*0.035),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'confirm password',
                prefixIcon: Icon(Icons.person),
                fillColor: Colors.white.withOpacity(.5),
                filled: true,
              ),
            ),   SizedBox(height:size.height*0.035,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myloginpage(),));
            }, child: Text('Ok',style: TextStyle(color: Colors.brown),))
          ],
        ),
      ),
    );
  }
}