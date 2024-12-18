import 'package:flutter/material.dart';

class Mysecurity extends StatefulWidget {
  const Mysecurity({super.key});

  @override
  State<Mysecurity> createState() => _MysecurityState();
}

class _MysecurityState extends State<Mysecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 245, 229, 223),),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Center(child: Text('Security and Privacy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
         SizedBox(height: 20,),
         Text('1. Data Security Practices:',style: TextStyle(fontSize: 18),),
         Text('We use encryption to protect your personal and payment information. All sensitive data is securely stored and transmitted using advanced security measures. Multi-factor authentication is available to keep your account secure.'),
        Text('2. User Rights and Choices:',style: TextStyle(fontSize: 18),),
        Text('You can manage your personal data and communications preferences by visiting your account settings. If you d like to delete your account and all associated data, you can request this directly through the app.')
        ],
      ),
    );
  }
}