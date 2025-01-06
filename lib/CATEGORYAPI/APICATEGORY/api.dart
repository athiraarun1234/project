import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:petadoptionapp/CATEGORYAPI/MODELCATEGORY/model.dart';


class CategoryProvider with ChangeNotifier {
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

  List<Categories> _category = [];
  List<Categories> get category {
    return [..._category];
  }

  Future getAllCategoriesData({required BuildContext context}) async {
    try {
      _isLoading = true;
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/pet_shop/api/view_categories.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/pet_shop/api/view_categories.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _category = [];
        var extractedData = json.decode(response.body);
        final List<dynamic> categorydetails = extractedData['categories'];
        for (var i = 0; i < categorydetails.length; i++) {
          _category.add(
            Categories(
              id: categorydetails[i]['id'].toString(),
              name: categorydetails[i]['name'].toString(),
              photo: categorydetails[i]['photo'].toString(),  
            ),
          );
        }
        ;

        print('product details' + _category.toString());
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
