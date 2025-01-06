
// import 'package:flutter/material.dart';
// import 'package:petadoptionapp/APIINTEGRATION/API/api.dart';
// import 'package:petadoptionapp/APIINTEGRATION/WIDGET/widget.dart';
// import 'package:provider/provider.dart';

// class PetsScreen extends StatefulWidget {
//   static const routename='adoptionscreen';
//   const PetsScreen({super.key});

//   @override
//   State<PetsScreen> createState() => _PetsScreenState();
// }

// class _PetsScreenState extends State<PetsScreen> {
//    @override
//   void initState() {
//     Provider.of<Petprovider>(context, listen: false)
//         .getAllPetsData(context: context);
  
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//      final adopt = Provider.of<Petprovider>(context);
//      final size=MediaQuery.of(context).size;
//     return 
      
//        adopt.loadingSpinner
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                            Text( 'Loading'),
//                           CircularProgressIndicator(
//                             color:Colors.green,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
                       
//                         ],
//                       )
//                     : adopt.pets.isEmpty
//                         ? Text('No Famers...')
//                         : SizedBox(
//                           height: size.height * 0.9,
//                             child: ListView.builder(
//                               scrollDirection: Axis.vertical,
//                               itemCount:adopt.pets. length,
//                               itemBuilder: (context, intex) {
//                                 return Petwidgets(
//         petid :adopt.pets[intex].petid,
//     name :adopt.pets[intex].name,
//     species :adopt.pets[intex].species,
//     breed :adopt.pets[intex].breed,
//     age :adopt.pets[intex].age,
//     sex :adopt.pets[intex].sex,
//     color :adopt.pets[intex].color,
//     weight :adopt.pets[intex].weight,
//     dob :adopt.pets[intex].dob,
//     microchipid :adopt.pets[intex].microchipid,
//     aid :adopt.pets[intex].aid,
//     diet :adopt.pets[intex].diet,
//     behaviour :adopt.pets[intex].behaviour,
//     status :adopt.pets[intex].status,
//     notes :adopt.pets[intex].notes,
//     addeddate :adopt.pets[intex].addeddate,
//     photo :adopt.pets[intex].photo);
//                               },
//                             ),
//                                     );
            
    
//   }
// }