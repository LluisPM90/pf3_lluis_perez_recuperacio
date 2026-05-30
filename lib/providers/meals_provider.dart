import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/meal.dart';
import '../models/meals_response.dart';

/// Provider encarregat de gestionar l'estat de l'aplicació.
///
/// Centralitza la lògica de negoci i el consum de l'API.
/// La interfície només consumeix les dades que proporciona
/// aquesta classe.
class MealsProvider extends ChangeNotifier {

  /// Llista de plats obtinguts des de TheMealDB.
  List<Meal> meals = [];

  /// Constructor.
  /// Quan es crea el Provider es carreguen automàticament
  /// les dades de l'API.
  MealsProvider() {
    getMeals();
  }

  /// Realitza una petició HTTP a TheMealDB.
  ///
  /// Converteix la resposta JSON en objectes Meal i
  /// actualitza l'estat de l'aplicació.
  Future<void> getMeals() async {

    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?s='
    );

    final response = await http.get(url);

    final mealsResponse = MealsResponse.fromJson(
      json.decode(response.body),
    );

    // Guardam els plats obtinguts de l'API.
    meals = mealsResponse.meals;

    // Notificam als widgets que l'estat ha canviat
    // perquè es reconstruïsquen automàticament.
    notifyListeners();
  }
}