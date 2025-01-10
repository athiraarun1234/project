import 'package:flutter/material.dart';
import 'package:petadoptionapp/APIINTEGRATION/API/api.dart';
import 'package:petadoptionapp/APIINTEGRATION/WIDGET/widget.dart';
import 'package:petadoptionapp/categorypage/dogcategory/DOGCATEGORYAPI/MODELDOGCATEGORY/APIDOGCATEGORY/api.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:provider/provider.dart';

class Mydogcataegory extends StatefulWidget {
  final String categoryid;
  static const routename='petsscreen2';
 
  const Mydogcataegory({super.key,required this.categoryid});

  @override
  State<Mydogcataegory> createState() => _MydogcataegoryState();
}

class _MydogcataegoryState extends State<Mydogcataegory> {
 @override
 void initState(){
  Provider.of<Categoryeachprovider>(context,listen: false).getAllPetData(context: context, categoryid:widget.categoryid);
  super.initState();
 }
  @override
  Widget build(BuildContext context) {
    final pet3=Provider.of<Categoryeachprovider>(context);
    final size=MediaQuery.of(context).size; 
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => Mynavigationbar(),));
        },
          child: Icon(Icons.arrow_back,color: Colors.brown,)),
        title: Text('categories',style: TextStyle(color: Colors.brown),),
      ),
        body: pet3.loadingSpinner
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text( 'Loading'),
                              CircularProgressIndicator(
                                color: Colors.green
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                           
                            ],
                          )
                        : pet3.pet2.isEmpty
                            ? Center(child: Text('No Pets...'))
                             : SizedBox(
                            //  height: size.height*0.09,
                             
       
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 0.7,
          ), 
        itemCount: pet3.pet2.length,
          itemBuilder: (context, intex) {
          return Petwidgets(
                                       petid :pet3.pet2[intex].petid,
                                        name :pet3.pet2[intex].name,
                                       species :pet3.pet2[intex].species,
                                        breed :pet3.pet2[intex].breed,
                                       age :pet3.pet2[intex].age,
                                        sex :pet3.pet2[intex].sex,
                                         color :pet3.pet2[intex].color,
                                         weight :pet3.pet2[intex].weight,
                                         dob :pet3.pet2[intex].dob,
                                          microchipid :pet3.pet2[intex].microchipid,
                                         aid :pet3.pet2[intex].aid,
                                         diet :pet3.pet2[intex].diet,
                                          behaviour :pet3.pet2[intex].behaviour,
                                           status :pet3.pet2[intex].status,
                                           notes :pet3.pet2[intex].notes,
                                          addeddate :pet3.pet2[intex].addeddate,
                                          photo :pet3.pet2[intex].photo);
                                    
                                  },
                                 
                   )
                 )      
             
                             );
   
      
    
  }
}