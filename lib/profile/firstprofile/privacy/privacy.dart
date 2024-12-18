import 'package:flutter/material.dart';

class Myprivacy extends StatefulWidget {
  const Myprivacy({super.key});

  @override
  State<Myprivacy> createState() => _MyprivacyState();
}

class _MyprivacyState extends State<Myprivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 230, 224),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('Privacy and Data Usage',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          Text('1.Information We Collect and How Its Used:',style: TextStyle(fontSize: 18),),
 Text('We collect personal data such as your name, email, address, and pet preferences to provide you with the best pet adoption experience.This information helps us match you with available pets and send updates about adoption opportunities.'),
        Text('2. User Rights and Data Management:',style: TextStyle(fontSize: 18),),
       Text('You have the right to access, update, or delete your personal information at any time. If you wish to delete your account, please go to the "Account Settings" section of the app or contact our support team.'),
         
        ],
      ),
    );
  }
}