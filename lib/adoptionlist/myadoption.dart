import 'package:flutter/material.dart';
import 'package:petadoptionapp/adoptionlist/ADOPTIONLISTAPI/MODELADOPTION/APIADOPTION/api.dart';
import 'package:petadoptionapp/adoptionlist/ADOPTIONLISTAPI/MODELADOPTION/WIDGETADOPTION/widget.dart';
import 'package:provider/provider.dart';

class Myadoption extends StatefulWidget {
  static const routname='adoptionlist';
  const Myadoption({super.key});

  @override
  State<Myadoption> createState() => _MyadoptionState();
}

class _MyadoptionState extends State<Myadoption> {
  @override
  void initState(){
   Provider.of<AdoptionProvider>(context,listen: false).getAllAdoptionData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final adoption=Provider.of<AdoptionProvider>(context);
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 197, 188),
        title: Text('My Adoption List',style: TextStyle(color: Colors.brown),),),
      body:  adoption.loadingSpinner
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
                      : adoption.adopt.isEmpty
                          ? Text('No Pets...')
                           : SizedBox(
                           
                     child:ListView.builder(
        itemCount:adoption.adopt.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return Adoptionwidget(
    orderId :adoption.adopt[index].orderId,
    petId :adoption.adopt[index].petId,
    userId :adoption.adopt[index].userId,
    orderStatus :adoption.adopt[index].orderStatus,
    date :adoption.adopt[index].date,
    name :adoption.adopt[index].name,
    species :adoption.adopt[index].species,
    breed :adoption.adopt[index].breed,
    age :adoption.adopt[index].age,
    sex :adoption.adopt[index].sex,
    color :adoption.adopt[index].color,
    weight :adoption.adopt[index].weight,
    dob :adoption.adopt[index].dob,
    microchipid :adoption.adopt[index].microchipid,
    diet :adoption.adopt[index].diet,
    behaviour :adoption.adopt[index].behaviour,
    petStatus :adoption.adopt[index].petStatus,
    notes :adoption.adopt[index].notes,
    addeddate :adoption.adopt[index].addeddate,
    photo :adoption.adopt[index].photo, 
                        );
                      },),
                           ),
    );
  }
}