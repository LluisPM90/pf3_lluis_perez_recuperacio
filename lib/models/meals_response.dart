import 'meal.dart';

/// Model que representa la resposta completa
/// retornada per l'API TheMealDB.
///
/// L'API retorna un objecte JSON amb una propietat
/// anomenada "meals" que conté una llista de plats.
class MealsResponse {

  /// Llista de plats rebuda des de l'API.
  List<Meal> meals;

  MealsResponse({
    required this.meals,
  });

  /// Converteix la resposta JSON en un objecte
  /// MealsResponse amb una llista d'objectes Meal.
  factory MealsResponse.fromJson(Map<String, dynamic> json) {

    return MealsResponse(
      meals: List<Meal>.from(
        json["meals"].map(
          (mealJson) => Meal.fromJson(mealJson),
        ),
      ),
    );
  }
}