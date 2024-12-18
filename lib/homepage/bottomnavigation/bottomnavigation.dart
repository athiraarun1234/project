 

import 'package:flutter/material.dart';
import 'package:petadoptionapp/adoptionlist/myadoption.dart';
import 'package:petadoptionapp/categorypage/allcategory.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
import 'package:petadoptionapp/homepage/menubar/menumyself.dart';
import 'package:petadoptionapp/profile/firstprofile/firstprofilepage.dart';

import 'package:petadoptionapp/wishlist/wishlist.dart';
class Mynavigationbar extends StatefulWidget {  
  Mynavigationbar ({Key ?key}) : super(key: key);  
  
  @override  
  _MynavigationbarState createState() => _MynavigationbarState();  
}  
  
class _MynavigationbarState extends State<Mynavigationbar > {  
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[
    Myhomepage(),
    Mycategorypage(), 
    Mywishlist(),  
    Myprofilepage(), 
     // Text('favorites', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];  
  
  void tapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
       
       title:  Column(
         children: [
           Text('Hi Athira',style: TextStyle(fontSize: 14),),
            Text('Enjoy our services',style: TextStyle(fontSize: 11),),
         ],
       ),  
       actions: [
       GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => Myadoption(),));
        },
        child: Image.asset('assets/peticons.png',scale: 6,))
       ], 
      ),  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 246, 230, 223),
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Athira A'), accountEmail: Text('athira@gmail.com'),
            currentAccountPicture: CircleAvatar(radius: 50,
            backgroundImage: AssetImage('assets/lady.png'),
            ),
            decoration: BoxDecoration(color:Colors.blueGrey),
            ),
            Column(
              children: [
                ListTile(leading: Icon(Icons.home),
                title: Text('Home'),
                ),
                 ListTile(leading: Icon(Icons.category_outlined),
                title: Text('Category'),
                ),
                 ListTile(leading: Icon(Icons.shop),
                title: Text('My orders'),
                ),
                 ListTile(leading: Icon(Icons.favorite),
                title: Text('Wishlist'),
                ),
                
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(  
        backgroundColor:  Colors.white,
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home),  
            label: 'Home',  
            backgroundColor: Colors.green  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.category_outlined),  
            label: 'Category',  
            backgroundColor: Colors.yellow  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.favorite_border),  
            label: 'Wishlist',  
            backgroundColor: Colors.blue,  
          ), 
           BottomNavigationBarItem(  
            icon: Icon(Icons.person),  
            label: 'Profile',  
            backgroundColor: Colors.yellow  
          ),   
        ],  
        type: BottomNavigationBarType.fixed,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.brown[400],  
        unselectedItemColor: const Color.fromARGB(255, 141, 132, 132)
        ,
        iconSize: 30,  
        onTap:tapped,  
        elevation: 10 
      ),  
    );  
  }  
}  