import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:petadoptionapp/adoptionlist/ADOPTIONLISTAPI/MODELADOPTION/MODEL.dart';


class AdoptionProvider with ChangeNotifier {
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

  List<Adoptionlist> _adopt = [];
  List<Adoptionlist> get adopt {
    return [..._adopt];
  }

  Future getAllAdoptionData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_adoption_status.php?user_id=1"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_adoption_status.php?user_id=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _adopt = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> adoptionlist = extractedData['orders'];
        for (var i = 0; i < adoptionlist.length; i++) {
          _adopt.add(
            Adoptionlist(
    orderId :adoptionlist[i]['order_id'].toString(),
    petId :adoptionlist[i]['pet_id'].toString(),
    userId :adoptionlist[i]['user_id'].toString(),
    orderStatus :adoptionlist[i]['order_status'].toString(),
    date :adoptionlist[i]['date'].toString(),
    name :adoptionlist[i]['name'].toString(),
    species :adoptionlist[i]['species'].toString(),
    breed :adoptionlist[i]['breed'].toString(),
    age :adoptionlist[i]['age'].toString(),
    sex :adoptionlist[i]['sex'].toString(),
    color :adoptionlist[i]['color'].toString(),
    weight :adoptionlist[i]['weight'].toString(),
    dob :adoptionlist[i]['dob'].toString(),
    microchipid :adoptionlist[i]['microchipid'].toString(),
    diet :adoptionlist[i]['diet'].toString(),
    behaviour :adoptionlist[i]['behaviour'].toString(),
    petStatus :adoptionlist[i]['pet_status'].toString(),
    notes :adoptionlist[i]['notes'].toString(),
    addeddate :adoptionlist[i]['addeddate'].toString(),
    photo :adoptionlist[i]['photo'].toString(), 
            ),
          );
        }
        ;

        print('product details' + _adopt.toString());
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
