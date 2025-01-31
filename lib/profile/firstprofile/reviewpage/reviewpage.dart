import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:petadoptionapp/FEEDBACK/feedback.dart';


class Myreviewpage extends StatefulWidget {
  const Myreviewpage({super.key});

  @override
  State<Myreviewpage> createState() => _MyreviewpageState();
}

class _MyreviewpageState extends State<Myreviewpage> {
  File? testFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 210, 201),
        title: Text('Review',style: TextStyle(color: Colors.brown),),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rate the app',style: TextStyle(fontSize: 20,color: Colors.brown),),
              Row(
                children: [
                RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize:25,
                          itemBuilder: (context,_) =>const
                          Icon(Icons.star,color:Colors.red,),
                          glow: false,
                          onRatingUpdate: (creating) {},
                ),
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Feed back and suggestions',style: TextStyle(color: Colors.brown,fontSize:20),),
            GestureDetector(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Myfeedback(),));
             },
              child: Icon(Icons.arrow_forward_ios_outlined))
          ],
          ),
        ],
      ),
    );
  }
}