import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:petadoptionapp/profile/firstprofile/myself/myself.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';
import 'package:provider/provider.dart';


class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();

    Future<dynamic> updateProfileApi() async {
    try {
      final user = Provider.of<ProfilePetsProvider>(context, listen: false);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/edit_profile.php'),
      );
      print(
          'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/edit_profile.php');
      request.fields.addAll({
        'firstname': namecontroller.text.trim(),
        'address':addresscontroller.text.trim(),
        'email': emailcontroller.text.trim(),
        'phone': phonecontroller.text.trim(),
        'user_id': user.currentUserId ?? "1"
      });
    //     if (image != null) {
    //   request.files.add(await http.MultipartFile.fromPath('image', image!.path));
    // }
      http.StreamedResponse response = await request.send();

      print(await response.stream.bytesToString());
      print(""" 'name': ${namecontroller.text.trim()},
      'address': ${addresscontroller.text.trim()},
        'phone': ${phonecontroller.text.trim()},
        'email': 'mailto:jose@gmail.com',
        'user_id': ${user.currentUserId}?? "1" """);
      if (response.statusCode == 200) { 
         
          
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:Colors.amber,
                                  content: const Text("Profile Updated successfully...!",
                                  style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Myself()));
                         
                        
        

        print(await response.stream.bytesToString());
      } else { 
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
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
                    radius: 20,
                   // backgroundColor: const Color.fromARGB(255, 224, 142, 142),
                    child: Icon(Icons.camera_alt_outlined,size: 32,),
                  ))
             ], ),
              ),
              SizedBox(height: 55,),
              Profile(Icons.person,'Name',namecontroller),SizedBox(height: 20,),
              Profile(Icons.place,'Address',addresscontroller),SizedBox(height: 20,),
              Profile(Icons.email,'Email',emailcontroller),SizedBox(height: 20,),
              Profile(Icons.phone,'Phone',phonecontroller),SizedBox(height: 20,),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                                onPressed: (){
                                  updateProfileApi();
                                }, child:Text('Save',style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
    Widget Profile(IconData icon,String name,TextEditingController controller )
    {
      return TextFormField(
        controller: controller,
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