import 'package:flutter/material.dart';


class Myhelp extends StatefulWidget {
  const Myhelp({super.key});

  @override
  State<Myhelp> createState() => _MyhelpState();
}

class _MyhelpState extends State<Myhelp> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 163, 136),
        title: Text('Help',style: TextStyle(color: Colors.brown),),
      ),
      body: Column(
        children: [
          Text('Do you have any help?',style: TextStyle(color: Colors.brown,fontSize: 17,fontWeight:FontWeight.normal),),
          SizedBox(height:size.height*0.025,),
          Image(image: AssetImage('assets/helps.png')),
          ElevatedButton(onPressed: (){
              //  final call = Uri.parse('tel:+91 9830268966');
              //       if (await canLaunchUrl(call)) {
              //         launchUrl(call);
              //       } else {
              //         throw 'Could not launch $call';
              //       }
                     
          }, child:Text('Call us'))
        ],
      ),
    );
  }
}