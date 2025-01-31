import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:petadoptionapp/APIINTEGRATION/MODEL/model.dart';



class Petprovider with ChangeNotifier {
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

  List<PetDetails> _pets = [];
  List<PetDetails> get pets {
    return [..._pets];
  }
  List<PetDetails>_serachproducts=[];
  List<PetDetails>get searchproducts{
    return [..._serachproducts];
  }
   List<PetDetails>_filterproducts=[];
  List<PetDetails>get filterproducts{
    return [..._filterproducts];
  }

  Future getAllPetsData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewallpets.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewallpets.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pets = [];
        _filterproducts=[];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> petadoption = extractedData['petDetails'];
        for (var i = 0; i < petadoption.length; i++) {
          _pets.add(
            PetDetails(
 petid :petadoption[i]['petid'].toString(),
    name :petadoption[i]['name'].toString(),
    species :petadoption[i]['species'].toString(),
    breed :petadoption[i]['breed'].toString(),
    age :petadoption[i]['age'].toString(),
    sex :petadoption[i]['sex'].toString(),
    color :petadoption[i]['color'].toString(),
    weight :petadoption[i]['weight'].toString(),
    dob :petadoption[i]['dob'].toString(),
    microchipid :petadoption[i]['microchipid'].toString(),
    aid :petadoption[i]['aid'].toString(),
    diet :petadoption[i]['diet'].toString(),
    behaviour :petadoption[i]['behaviour'].toString(),
    status :petadoption[i]['status'].toString(),
    notes :petadoption[i]['notes'].toString(),
    addeddate :petadoption[i]['addeddate'].toString(),
    photo :petadoption[i]['photo'],),   
            
          );
        }

        print('product details' + _pets.toString());
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
   Future getAllSearchData({required BuildContext context,dynamic keyword}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/search_pet.php?keyword=$keyword"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/search_pet.php?keyword=$keyword");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
       _serachproducts=[];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> searchdetails = extractedData['petDetails'];
        for (var i = 0; i < searchdetails .length; i++) {
          _serachproducts.add(
            PetDetails(
    petid :searchdetails[i]['petid'].toString(),
    name :searchdetails[i]['name'].toString(),
    species :searchdetails[i]['species'].toString(),
    breed :searchdetails[i]['breed'].toString(),
    age :searchdetails[i]['age'].toString(),
    sex :searchdetails[i]['sex'].toString(),
    color :searchdetails[i]['color'].toString(),
    weight :searchdetails[i]['weight'].toString(),
    dob :searchdetails[i]['dob'].toString(),
    microchipid :searchdetails[i]['microchipid'].toString(),
    aid :searchdetails[i]['aid'].toString(),
    diet :searchdetails[i]['diet'].toString(),
    behaviour :searchdetails[i]['behaviour'].toString(),
    status :searchdetails[i]['status'].toString(),
    notes :searchdetails[i]['notes'].toString(),
    addeddate :searchdetails[i]['addeddate'].toString(),
    photo :searchdetails[i]['photo'],   
            ),
          );
        }
        ;
        print('product details' + _serachproducts.toString());
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