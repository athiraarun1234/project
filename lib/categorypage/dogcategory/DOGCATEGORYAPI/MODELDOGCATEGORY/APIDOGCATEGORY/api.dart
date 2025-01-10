

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:petadoptionapp/APIINTEGRATION/MODEL/model.dart';
import 'package:petadoptionapp/categorypage/dogcategory/DOGCATEGORYAPI/MODELDOGCATEGORY/model.dart';



class Categoryeachprovider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<Petcategory> _pet2 = [];
  List<Petcategory> get pet2 {
    return [..._pet2];
  }

  Future getAllPetData({required BuildContext context,required String categoryid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_pets_category.php?category_id=$categoryid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_pets_category.php?category_id=$categoryid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pet2 = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> petadoption2 = extractedData['petDetails'];
        for (var i = 0; i < petadoption2.length; i++) {
          _pet2.add(
            Petcategory(
 petid :petadoption2[i]['petid'].toString(),
    name :petadoption2[i]['name'].toString(),
    species :petadoption2[i]['species'].toString(),
    breed :petadoption2[i]['breed'].toString(),
    age :petadoption2[i]['age'].toString(),
    sex :petadoption2[i]['sex'].toString(),
    color :petadoption2[i]['color'].toString(),
    weight :petadoption2[i]['weight'].toString(),
    dob :petadoption2[i]['dob'].toString(),
    microchipid :petadoption2[i]['microchipid'].toString(),
    aid :petadoption2[i]['aid'].toString(),
    diet :petadoption2[i]['diet'].toString(),
    behaviour :petadoption2[i]['behaviour'].toString(),
    status :petadoption2[i]['status'].toString(),
    notes :petadoption2[i]['notes'].toString(),
    addeddate :petadoption2[i]['addeddate'].toString(),
    photo :petadoption2[i]['photo'],),   
            
          );
        }

        print('product details' + _pet2.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
 
}