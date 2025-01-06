import 'package:flutter/material.dart';
import 'package:petadoptionapp/FAVORITEAPI/APIFAVORITE/api.dart';
import 'package:petadoptionapp/FAVORITEAPI/WIDGETFAVOURITE/widget.dart';
import 'package:provider/provider.dart';

class Mywishlist extends StatefulWidget {
  static const routname='favoritescreen';
  const Mywishlist({super.key});

  @override
  State<Mywishlist> createState() => _MywishlistState();
}

class _MywishlistState extends State<Mywishlist> {
  @override
  void initState(){
    Provider.of<PetfavoriteProvider>(context,listen:false).getAllFavoriteData(context:context);
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    final favorite=Provider.of<PetfavoriteProvider>(context);
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
       child:  Expanded(
            child: favorite.loadingSpinner
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
                        : favorite.favor.isEmpty
                            ? Text('No Pets...')
                             : SizedBox(
                  child:SizedBox(
                    height:size.height*0.9,
                     child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                   crossAxisSpacing: 15,mainAxisSpacing: 15,childAspectRatio: 0.7
                                   ), scrollDirection: Axis.vertical,
                                   itemCount:favorite.favor.length,
                                   itemBuilder: (context, index) {
                      return Myfavoritewidgets(
    favId : favorite.favor[index].favId,
    petid : favorite.favor[index].petid,
    name : favorite.favor[index].name,
    species : favorite.favor[index].species,
    breed : favorite.favor[index].breed,
    age : favorite.favor[index].age,
    sex : favorite.favor[index].sex,
    color : favorite.favor[index].color,
    weight : favorite.favor[index].weight,
    dob : favorite.favor[index].dob,
    microchipid : favorite.favor[index].microchipid,
    aid : favorite.favor[index].aid,
    diet : favorite.favor[index].diet,
    behaviour : favorite.favor[index].behaviour,
    status : favorite.favor[index].status,
    notes : favorite.favor[index].notes,
    addeddate : favorite.favor[index].addeddate,
    photo : favorite.favor[index].photo,
                  
                      );
                                    },
                                   
                     )
                   )      
            ),
          ), 
      
      )
    );
  }
}