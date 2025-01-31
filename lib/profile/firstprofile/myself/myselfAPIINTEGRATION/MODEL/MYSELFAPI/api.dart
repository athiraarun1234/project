import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:petadoptionapp/profile/firstprofile/myself/myselfAPIINTEGRATION/MODEL/model.dart';

class ProfilePetsProvider with ChangeNotifier {
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

  List<UserDetails> _user = [];
  List<UserDetails> get users {
    return [..._user];
  }

  String? currentUserId;
  void setCurrentUserId(String userId) {
    currentUserId = userId;
    notifyListeners();
  }

  Future profileData({required BuildContext context}) async {
    try {
      _isLoading = true;

      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_profile.php?user_id=$currentUserId"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_profile.php?user_id=$currentUserId");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _user = [];
        var extractedData = json.decode(response.body);
        if (extractedData is Map<String, dynamic> &&
            extractedData.containsKey('userDetails')) {
          final userDetails = extractedData['userDetails'];
          _user.add(
            UserDetails(
              userid: userDetails['userid'].toString(),
              firstname: userDetails['firstname'].toString(),
              lastname: userDetails['lastname'].toString(),
              email: userDetails['email'].toString(),
              phone: userDetails['phone'].toString(),
              address: userDetails['address'].toString(),
              photo: userDetails['photo'].toString(),
              dob: userDetails['dob'].toString(),
              gender: userDetails['gender'].toString(),
            ),
          );
        }

        print('product details' + _user.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
