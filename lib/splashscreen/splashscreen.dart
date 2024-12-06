import 'package:flutter/material.dart';
import 'package:petadoptionapp/loginpage/loginpage.dart';

class Mysplashscreen extends StatefulWidget {
  const Mysplashscreen({super.key});

  @override
  State<Mysplashscreen> createState() => _MysplashscreenState();
}

class _MysplashscreenState extends State<Mysplashscreen> {
  @override
  void initState() {
    super.initState();
   _navigatetohome();
  }
 _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  Myloginpage()));}
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/splashscreen.jpg'),fit: BoxFit.cover)
        ),
      ),
    );
  }
}