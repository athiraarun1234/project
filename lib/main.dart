import 'package:flutter/material.dart';
import 'package:petadoptionapp/APIINTEGRATION/API/api.dart';
import 'package:petadoptionapp/CATEGORYAPI/APICATEGORY/api.dart';
import 'package:petadoptionapp/FAVORITEAPI/APIFAVORITE/api.dart';
import 'package:petadoptionapp/adoptionlist/ADOPTIONLISTAPI/MODELADOPTION/APIADOPTION/api.dart';
import 'package:petadoptionapp/adoptionlist/myadoption.dart';
import 'package:petadoptionapp/categorypage/allcategory.dart';
import 'package:petadoptionapp/categorypage/categorywidget.dart';
import 'package:petadoptionapp/categorypage/dogcategory/DOGCATEGORYAPI/MODELDOGCATEGORY/APIDOGCATEGORY/api.dart';
import 'package:petadoptionapp/categorypage/dogcategory/dogcategory.dart';
import 'package:petadoptionapp/detailpage/detailpage.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
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

      },
    
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
