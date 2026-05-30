class Meal {

  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        idMeal: json["idMeal"] ?? '',
        strMeal: json["strMeal"] ?? '',
        strCategory: json["strCategory"] ?? '',
        strArea: json["strArea"] ?? '',
        strInstructions: json["strInstructions"] ?? '',
        strMealThumb: json["strMealThumb"] ?? '',
      );
}