 import 'package:flutter/material.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
class Mynavigationbar extends StatefulWidget {  
  Mynavigationbar ({Key ?key}) : super(key: key);  
  
  @override  
  _MynavigationbarState createState() => _MynavigationbarState();  
}  
  
class _MynavigationbarState extends State<Mynavigationbar > {  
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[
    Myhomepage(),  
   // Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
     Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('favorites', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
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
       leading: Icon(Icons.menu),  
       title:  Column(
         children: [
           Text('Hi Athira',style: TextStyle(fontSize: 14),),
            Text('Enjoy our services',style: TextStyle(fontSize: 11),),
         ],
       ),  
       actions: [
       Image.asset('assets/peticons.png',scale: 6,)
       ], 
      ),  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
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