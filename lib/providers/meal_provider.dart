import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../models/meal_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealProvider with ChangeNotifier {
  final String host = 'https://api-c4m.herokuapp.com';
  List<Meal> _meals = [];
  bool isLoading = false;

  UnmodifiableListView<Meal> get meals => UnmodifiableListView(_meals);

  Meal getMealByName(String mealName) =>
      meals.firstWhere((meal) => meal.name == mealName);

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response = await http.get('$host/api/meals');
      print(response.statusCode);
      if (response.statusCode == 201) {
        _meals = (json.decode(response.body) as List).map((mealJson) {
          return Meal.fromJson(mealJson);
        }).toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
