 

import 'package:flutter/material.dart';
import 'package:petadoptionapp/adoptionlist/myadoption.dart';
import 'package:petadoptionapp/categorypage/allcategory.dart';
import 'package:petadoptionapp/homepage/homepage.dart';
import 'package:petadoptionapp/loginpage/loginpage.dart';
import 'package:petadoptionapp/profile/firstprofile/firstprofilepage.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';

import 'package:petadoptionapp/wishlist/wishlist.dart';
import 'package:provider/provider.dart';
class Mynavigationbar extends StatefulWidget {  
  Mynavigationbar ({Key ?key}) : super(key: key);  
  
  @override  
  _MynavigationbarState createState() => _MynavigationbarState();  
}  
  
class _MynavigationbarState extends State<Mynavigationbar > {  
  @override
  void initState(){
    Provider.of<ProfilePetsProvider>(context,listen: false).profileData(context: context);
    super.initState();
  }
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[
    Myhomepage(),
    Mycategorypage(), 
    Mywishlist(),  
    Myprofilepage(), 
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
          Consumer<ProfilePetsProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].firstname;
                  print(userAddress+'vvvvvvvvv');
                }
                return Text(
                  'Hi $userAddress',
                 style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16,color: Colors.blue),
                );
              }),
          // Text('Hi Athira',style: TextStyle(fontSize: 14),),
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
            UserAccountsDrawerHeader(accountName: 
             Consumer<ProfilePetsProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].firstname;
                  print(userAddress+'vvvvvvvvv');
                }
                return Text(
                  ' $userAddress',
                 style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16,color: Colors.blue),
                );
              }),
           // Text('Athira A'), 
            accountEmail:
            Consumer<ProfilePetsProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].email;
                  print(userAddress+'vvvvvvvvv');
                }
                return Text(
                  ' $userAddress',
                 style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16,color: Colors.blue),
                );
              }), 
            //Text('athira@gmail.com'),
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
                ElevatedButton(onPressed: () {
             showDialog(context: context, builder:(context) {
               return AlertDialog(
                content: Text('Are you want to exit the app?'),
                actions: [
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Myloginpage(),));
                   }, 
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 233, 217, 211).withOpacity(0.5)),
                  child: Text('Yes')),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                   }, 
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 231, 207, 199).withOpacity(0.5)),
                  child: Text('No'))
                ],
               );
             },);
           }, style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      child     : Text('Logout',style: TextStyle(color: Colors.brown),)),
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