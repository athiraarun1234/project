import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:petadoptionapp/FAVORITEAPI/MODELFAVORITE/model.dart';
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/MYSELFAPI/api.dart';
import 'package:provider/provider.dart';


class PetfavoriteProvider with ChangeNotifier {
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

  List<Petfavorites> _favor = [];
  List<Petfavorites> get favor {
    return [..._favor];
  }

  Future getAllFavoriteData({BuildContext? context, String? userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewfavpets.php?aid=$userid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewfavpets.php?aid=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _favor = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> favoriteDetails = extractedData['petDetails'];
        for (var i = 0; i < favoriteDetails.length; i++) {
          _favor.add(
            Petfavorites(        
    favId : favoriteDetails[i]['fav_id'].toString(),
    petid : favoriteDetails[i]['petid'].toString(),
    name : favoriteDetails[i]['name'].toString(),
    species : favoriteDetails[i]['species'].toString(),
    breed : favoriteDetails[i]['breed'].toString(),
    age : favoriteDetails[i]['age'].toString(),
    sex : favoriteDetails[i]['sex'].toString(),
    color : favoriteDetails[i]['color'].toString(),
    weight : favoriteDetails[i]['weight'].toString(),
    dob : favoriteDetails[i]['dob'].toString(),
    microchipid : favoriteDetails[i]['microchipid'].toString(),
    aid : favoriteDetails[i]['aid'].toString(),
    diet : favoriteDetails[i]['diet'].toString(),
    behaviour : favoriteDetails[i]['behaviour'].toString(),
    status : favoriteDetails[i]['status'].toString(),
    notes : favoriteDetails[i]['notes'].toString(),
    addeddate : favoriteDetails[i]['addeddate'].toString(),
    photo : favoriteDetails[i]['photo'].toString(),
                  
            ),
          );
        }
        ;

        print('product details' + _favor.toString());
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
Future<void> deleteFav(String? favId, BuildContext context) async {
    final user = Provider.of<ProfilePetsProvider>(context, listen: false);
    final url = Uri.parse(
        'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/delete_fav.php?fid=$favId');

    try {
      final response = await https.delete(url);
      print(url);
      if (response.statusCode == 200) {
        getAllFavoriteData(userid: user.currentUserId);
        // Cart deleted successfully
        print('Cart deleted successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }

 Future<void> addItemToFavourites(
      {String? petid, String? userid}) async {
    var body = {
      'petid': petid.toString(),
      'aid': userid.toString(),
     
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/addfavpet.php?aid=$userid&petid=$petid'),
          body: body);

      if (response.statusCode == 200) {
        // Request successful
        print('Added to cart successfully');
        print('Response: ${response.body}');
      } else {
        // Request failed with error code
        print('Failed to add to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception thrown during request
      print('Failed to add to cart. Exception: $e');
    }
  }
}
