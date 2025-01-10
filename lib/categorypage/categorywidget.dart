import 'package:flutter/material.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';

class Mycategorywidget extends StatefulWidget {
  final String id;
  final String name;
  final String photo;
  const Mycategorywidget({
    super.key,
    required this. id,
    required this.name,
    required this.photo,
  });

  @override
  State<Mycategorywidget> createState() => _MycategorywidgetState();
}

class _MycategorywidgetState extends State<Mycategorywidget> {
  @override
  Widget build(BuildContext context) {
          return  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Mydogcataegory(categoryid: widget.id)));
                        },
                        child: Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(color: const Color.fromARGB(255, 152, 89, 66).withOpacity(0.5),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                          image: DecorationImage(image: NetworkImage(widget.photo),fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        width:350 ,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 244, 234, 234).withOpacity(0.5),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
                        ),
                      child: Center(child: Text(widget.name,style: TextStyle(color: Colors.brown,fontWeight: FontWeight.normal,fontSize: 20),)),
                      )
                    ],
                  );
  }
}