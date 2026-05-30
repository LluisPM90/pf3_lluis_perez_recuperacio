import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/meal.dart';
import '../models/meals_response.dart';

class MealsProvider extends ChangeNotifier {

  List<Meal> meals = [];

  MealsProvider() {
    getMeals();
  }

  Future<void> getMeals() async {

    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?s='
    );

    final response = await http.get(url);

    final mealsResponse = MealsResponse.fromJson(
      json.decode(response.body),
    );

    meals = mealsResponse.meals;

    notifyListeners();
  }
}