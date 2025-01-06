import 'package:flutter/material.dart';
import 'package:petadoptionapp/APIINTEGRATION/API/api.dart';
import 'package:petadoptionapp/APIINTEGRATION/WIDGET/widget.dart';
import 'package:petadoptionapp/APIINTEGRATION/design/design.dart';
import 'package:petadoptionapp/CATEGORYAPI/APICATEGORY/api.dart';
import 'package:petadoptionapp/CATEGORYAPI/WIDGETCATEGORY/widget.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';
import 'package:provider/provider.dart';

class Myhomepage extends StatefulWidget {
  static const routname='adoptionscreen';
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  void initState(){
    Provider.of<Petprovider>(context,listen: false).getAllPetsData(context: context);
     Provider.of<CategoryProvider>(context,listen: false).getAllCategoriesData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final adopted=Provider.of<Petprovider>(context);
    final category1=Provider.of<CategoryProvider>(context);
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'Search',hintStyle: TextStyle(fontSize: 14),
                        prefixIcon: Icon(Icons.search_outlined),
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:  const Color.fromARGB(255, 239, 198, 185),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Text('Join Pet lovers ',style: TextStyle(color: Colors.brown,fontSize: 22,
                            fontWeight: FontWeight.bold
                            ),),
                            Text(' Community',style: TextStyle(color: Colors.brown,fontSize: 22,
                            fontWeight: FontWeight.bold
                            ),),
                             Text('We are building friends circle who love pet',style: TextStyle(color: Colors.brown,fontSize: 10,
                            fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 10,),
                            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                              onPressed: (){}, child:Text('Call us',style: TextStyle(color: Colors.white),))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Image.asset('assets/front-3.png',scale: 4,),
                          )
                          
                        
                        ],
                      ),
                    ),
                   
                    Text('Categories',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
                     category1.loadingSpinner
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
                      : category1.category.isEmpty
                          ? Text('No Pets...')
                           : SizedBox(
                           
                   child:  SizedBox(
                      height: 120,
                      child: ListView.builder(scrollDirection: Axis.horizontal,
                      itemCount: category1.category.length,
                        itemBuilder: (context, index) {
                        return Categorywidget(
                                        id :category1.category[index].id,
                                        name :category1.category[index].name,
                                        photo :category1.category[index].photo,
                        );
                      },),
                    ),
                           ),
                           Text('Popular pets near you',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
                    adopted.loadingSpinner
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
                      : adopted.pets.isEmpty
                          ? Text('No Pets...')
                           : SizedBox(
                           
                 child:Container(
                  height: 450,
                   child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                 crossAxisSpacing: 15,mainAxisSpacing: 15,childAspectRatio: 0.7
                                 ), scrollDirection: Axis.vertical,
                                 itemCount:adopted.pets.length,
                                 itemBuilder: (context, intex) {
                    return Petwidgets(
                                       petid :adopted.pets[intex].petid,
                                        name :adopted.pets[intex].name,
                                       species :adopted.pets[intex].species,
                                        breed :adopted.pets[intex].breed,
                                       age :adopted.pets[intex].age,
                                        sex :adopted.pets[intex].sex,
                                         color :adopted.pets[intex].color,
                                         weight :adopted.pets[intex].weight,
                                         dob :adopted.pets[intex].dob,
                                          microchipid :adopted.pets[intex].microchipid,
                                         aid :adopted.pets[intex].aid,
                                         diet :adopted.pets[intex].diet,
                                          behaviour :adopted.pets[intex].behaviour,
                                           status :adopted.pets[intex].status,
                                           notes :adopted.pets[intex].notes,
                                          addeddate :adopted.pets[intex].addeddate,
                                          photo :adopted.pets[intex].photo);
                                    
                                  },
                                 
                   )
                 )      
          ),
                
       ], ),
    )));
  }
}