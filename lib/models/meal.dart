/// Model que representa un plat de cuina.
///
/// Aquesta classe s'utilitza per convertir la informació
/// rebuda des de l'API TheMealDB en objectes Dart.
class Meal {

  /// Identificador únic del plat.
  String idMeal;

  /// Nom del plat.
  String strMeal;

  /// Categoria del plat.
  String strCategory;

  /// País o origen del plat.
  String strArea;

  /// Instruccions de preparació.
  String strInstructions;

  /// URL de la imatge del plat.
  String strMealThumb;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
  });

  /// Constructor factory que converteix un objecte JSON
  /// en una instància de la classe Meal.
  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        idMeal: json["idMeal"] ?? '',
        strMeal: json["strMeal"] ?? '',
        strCategory: json["strCategory"] ?? '',
        strArea: json["strArea"] ?? '',
        strInstructions: json["strInstructions"] ?? '',
        strMealThumb: json["strMealThumb"] ?? '',
      );
}