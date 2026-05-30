import 'meal.dart';

class MealsResponse {

  List<Meal> meals;

  MealsResponse({
    required this.meals,
  });

  factory MealsResponse.fromJson(Map<String, dynamic> json) {

    return MealsResponse(
      meals: List<Meal>.from(
        json["meals"].map((x) => Meal.fromJson(x)),
      ),
    );
  }
}