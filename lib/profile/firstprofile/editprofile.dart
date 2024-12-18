import 'package:flutter/material.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 195, 184),
        title: Text('Profile Details',style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [SizedBox(height: 25,),
              Center(
                child: Stack(
                  children:[ CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/lady.png'),
                  ),
                  Positioned(
                    left: 80,
                    right: 80,
                    top: 50,
                    child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.camera_alt_outlined,size: 32,),
                  ))
             ], ),
              ),
              SizedBox(height: 55,),
              Profile(Icons.person,'Name'),SizedBox(height: 20,),
              Profile(Icons.place,'Address'),SizedBox(height: 20,),
              Profile(Icons.email,'Email'),SizedBox(height: 20,),
              Profile(Icons.phone,'Phone'),SizedBox(height: 20,),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                                onPressed: (){}, child:Text('Save',style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
    Widget Profile(IconData icon,String name)
    {
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: name,hintStyle: TextStyle(color: Colors.brown,fontSize: 15,fontWeight:FontWeight.normal),
          prefixIcon:Icon(icon),
        ),
      );
    }
}