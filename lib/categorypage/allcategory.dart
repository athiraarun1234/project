import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petadoptionapp/CATEGORYAPI/APICATEGORY/api.dart';
import 'package:petadoptionapp/CATEGORYAPI/WIDGETCATEGORY/widget.dart';
import 'package:petadoptionapp/categorypage/categorywidget.dart';
import 'package:petadoptionapp/categorypage/dogcategory/DOGCATEGORYAPI/MODELDOGCATEGORY/APIDOGCATEGORY/api.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';
import 'package:provider/provider.dart';

class Mycategorypage extends StatefulWidget {
    static const routname='categoryscreen';
  const Mycategorypage({super.key});

  @override
  State<Mycategorypage> createState() => _MycategorypageState();
}

class _MycategorypageState extends State<Mycategorypage> {
  @override
  void initState(){
    Provider.of<CategoryProvider>(context,listen: false).getAllCategoriesData(context: context);
    super .initState();
  }
  @override
  Widget build(BuildContext context) {
    final category2=Provider.of<CategoryProvider>(context);
    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories',style: TextStyle(color: Colors.brown,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
          Expanded(
            child: category2.loadingSpinner
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
                        : category2.category.isEmpty
                            ? Text('No Pets...')
                             : SizedBox(
                  child:SizedBox(
                    height:size.height*0.9,
                     child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                   crossAxisSpacing: 15,mainAxisSpacing: 15,childAspectRatio: 0.7
                                   ), scrollDirection: Axis.vertical,
                                   itemCount:category2.category.length,
                                   itemBuilder: (context, index) {
                      return Categorywidget(
                                         id :category2.category[index].id,
                                          name :category2.category[index].name,
                                          photo :category2.category[index].photo,
                      );
                                    },
                                   
                     )
                   )      
            ),
          ), 
                           
          ],
        ),
      ),
    );
  }
}