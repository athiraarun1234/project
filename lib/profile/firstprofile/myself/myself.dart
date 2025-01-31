import 'package:flutter/material.dart';

import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';
import 'package:provider/provider.dart';

class Myself extends StatefulWidget {
  static const routename='myself';
  const Myself({super.key});

  @override
  State<Myself> createState() => _MyselfState();
}

class _MyselfState extends State<Myself> {
  @override
  void initState(){
    Provider.of<ProfilePetsProvider
    >(context,listen: false).profileData(context: context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 224, 218),
        title: Text('My profile',style: TextStyle(color: Colors.brown),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 50,backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/lady.png'),
        
              ),
            ],
           ),SizedBox(height: 25,),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              gradient: LinearGradient(
                colors: [ Colors.white, const Color.fromARGB(255, 240, 215, 204)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
                //color:Colors.white.withOpacity(0.5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Consumer<ProfilePetsProvider>(builder: (context, value, child) {
                  String userAddress = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userAddress = value.users[i].firstname;
                    print(userAddress+'vvvvvvvvv');
                  }
                  return Text(
                    'Name :$userAddress',
                   style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16,color: Colors.brown),
                  );
                }),
                      Consumer<ProfilePetsProvider>(builder: (context, value, child) {
                  String userAddress = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userAddress = value.users[i].address;
                    print(userAddress+'vvvvvvvvv');
                  }
                  return Text(
                    'Address:$userAddress',
                   style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16,color: Colors.brown),
                  );
                }),
                   Consumer<ProfilePetsProvider>(builder: (context, value, child) {
                  String userAddress = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userAddress = value.users[i].email;
                    print(userAddress+'vvvvvvvvv');
                  }
                  return Text(
                    'Email :$userAddress',
                   style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16,color: Colors.brown),
                  );
                }),   
                 Consumer<ProfilePetsProvider>(builder: (context, value, child) {
                  String userAddress = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userAddress = value.users[i].phone;
                    print(userAddress+'vvvvvvvvv');
                  }
                  return Text(
                    'Phone :$userAddress',
                   style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16,color: Colors.brown),
                  );
                }),       
                  ],
                ),
              ), 
            ),
            //Text('Love and care the pets',style: TextStyle(color: const Color.fromARGB(255, 204, 159, 23),fontSize: 15),),
            //Image.asset('assets/profile.png')
          ],
        ),
      ),
    );
  }
}