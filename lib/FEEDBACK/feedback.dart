import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:petadoptionapp/homepage/bottomnavigation/bottomnavigation.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';
import 'package:provider/provider.dart';

class Myfeedback extends StatefulWidget {
  const Myfeedback({super.key});

  @override
  State<Myfeedback> createState() => _MyfeedbackState();
}

class _MyfeedbackState extends State<Myfeedback> {
   @override
  void initState(){
    Provider.of<ProfilePetsProvider>(context,listen: false).profileData(context: context);
    super.initState();
  }
  TextEditingController feedbackController = TextEditingController();

  Future<void> submitFeedback(String? message,String userid) async {
    try{
        final response = await http.post(
      Uri.parse(
          'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/add_feedback.php?user_id=$userid&message=$message'),
  
   
    );
    print('Response status:${response.statusCode}');
    print('Response body:${response.body}');

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit feedback. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }catch(e){
    print('Error:$e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('An error occurred .please try again'),
      backgroundColor: Colors.red,
    ));
  }
  }
  @override
  Widget build(BuildContext context) {
   final user=Provider.of<ProfilePetsProvider>(context);
  
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 236, 210, 201),
        title: Text('Support',style: TextStyle(color: Colors.brown),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [ SizedBox(height:size.height*0.02 ,),
              Container(
                height:size.height*0.075,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color:Colors.white
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email',style: TextStyle(color: Colors.brown,fontSize:16,fontWeight: FontWeight.bold),),
                    Icon(Icons.email,color: Colors.brown,)
                  ],
                ),
              ),
              SizedBox(height:size.height*0.02 ,),
                        Container(
               height:size.height*0.075,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color:Colors.white
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Call',style: TextStyle(color: Colors.brown,fontSize:16,fontWeight: FontWeight.bold),),
                    Icon(Icons.call,color: Colors.brown,)
                  ],
                ),
              ),
              Text('Any Feedback',style: TextStyle(color: Colors.brown,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(
                height:size.height*0.2, // Fixed height
                child: TextField(
                  controller: feedbackController,
                  maxLines: null, // Makes it expandable
                  expands: true, // Fills the parent height
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                ),
              ),
              ElevatedButton(onPressed: () async{
                submitFeedback(feedbackController.text.toString(),user.currentUserId.toString(),
                
                );
              await  Navigator.push(context,MaterialPageRoute(builder: (context) =>Mynavigationbar() ,));
              }, child: Text('Submit')),
              Image.asset('assets/star.png')
            ],
          ),
        ),
      ),
    );
  }
}
