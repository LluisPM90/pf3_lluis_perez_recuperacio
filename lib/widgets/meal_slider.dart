import 'package:flutter/material.dart';

// Importam el model Meal
import '../models/meal.dart';

class MealSlider extends StatelessWidget {

  // Llista de plats rebuda des del Provider
  final List<Meal> meals;

  const MealSlider({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      // Altura del slider
      height: 260,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,

        itemCount: meals.length,

        itemBuilder: (_, index) {

          final meal = meals[index];

          return GestureDetector(

            // Navegació a detall
            onTap: () {

              Navigator.pushNamed(
                context,
                'details',
                arguments: meal,
              );
            },

            child: Container(

              width: 140,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),

              child: Column(

                children: [

                  // Imatge del plat
                  ClipRRect(

                    borderRadius: BorderRadius.circular(20),

                    child: FadeInImage(

                      placeholder:
                          const AssetImage('assets/no-image.jpg'),

                      image: NetworkImage(meal.strMealThumb),

                      height: 180,
                      width: 140,

                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Nom del plat
                  Text(
                    meal.strMeal,

                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}