import 'package:flutter/material.dart';

import 'package:petadoptionapp/APIINTEGRATION/API/api.dart';
import 'package:petadoptionapp/CATEGORYAPI/APICATEGORY/api.dart';
import 'package:petadoptionapp/FAVORITEAPI/APIFAVORITE/api.dart';
import 'package:petadoptionapp/adoptionlist/ADOPTIONLISTAPI/MODELADOPTION/APIADOPTION/api.dart';
import 'package:petadoptionapp/adoptionlist/myadoption.dart';
import 'package:petadoptionapp/categorypage/allcategory.dart';
import 'package:petadoptionapp/categorypage/dogcategory/DOGCATEGORYAPI/MODELDOGCATEGORY/APIDOGCATEGORY/api.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myself.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';
import 'package:petadoptionapp/splashscreen/splashscreen.dart';
import 'package:petadoptionapp/wishlist/wishlist.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context)=>Petprovider(),
        ),
       ChangeNotifierProvider(create: (context) => CategoryProvider(),),
       ChangeNotifierProvider(create: (context)=>PetfavoriteProvider()),
      ChangeNotifierProvider(create: (context)=>Categoryeachprovider(),),
      ChangeNotifierProvider(create: (context)=>AdoptionProvider()),
      ChangeNotifierProvider(create: (context)=>ProfilePetsProvider()),
      ],
      
      child: MaterialApp(
      
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      
        home:Mysplashscreen(),
        routes:{
               'adoptionscreen':(context)=>Myhomepage (),
                'categoryscreen':(context)=> Mycategorypage (),
                'favoritescreen':(context)=>Mywishlist(),
                'petsscreen2':(context)=>Mydogcataegory(categoryid:'category_id'),
                 'pets_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return Mydetailpage( id: id,);
  },
  'adoptionlist':(context)=>Myadoption (),
  'myself':(context)=>Myself(),

      },
    
      ),
    );
  }
}

