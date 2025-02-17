import 'package:flutter/material.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';

class Categorywidget extends StatefulWidget {
final String id;
  final String name;
  final String photo;


  const Categorywidget({super.key,
   required this.id,
    required this.name, 
    required this.photo
  });

  @override
  State<Categorywidget> createState() => _CategorywidgetState();
}

class _CategorywidgetState extends State<Categorywidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Mydogcataegory(categoryid: widget.id)));
        },
        child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.brown.withOpacity(0.5),
                                    image: DecorationImage(image: NetworkImage(widget.photo),fit: BoxFit.cover)
                                  ),
                                ),
      ),
    );
  }
}