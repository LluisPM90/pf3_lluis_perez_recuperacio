import 'package:flutter/material.dart';

// Importam el model Meal
import '../models/meal.dart';

class CardSwiper extends StatelessWidget {

  // Llista de plats que reb el widget
  final List<Meal> meals;

  const CardSwiper({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {

    // Obtenim la mida de pantalla
    final size = MediaQuery.of(context).size;

    return SizedBox(

      // Amplada completa
      width: double.infinity,

      // Altura del swiper
      height: size.height * 0.5,

      // PageView per fer l'efecte swiper
      child: PageView.builder(

        controller: PageController(
          viewportFraction: 0.8,
          initialPage: 1,
        ),

        // Quantitat d'elements
        itemCount: meals.length,

        itemBuilder: (_, index) {

          // Obtenim el plat actual
          final meal = meals[index];

          return GestureDetector(

            // Navegació a pantalla de detall
            onTap: () {

              Navigator.pushNamed(
                context,
                'details',
                arguments: meal,
              );
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),

              child: ClipRRect(

                // Arrodonim cantonades
                borderRadius: BorderRadius.circular(20),

                child: FadeInImage(

                  // Imatge temporal mentre carrega
                  placeholder:
                      const AssetImage('assets/no-image.jpg'),

                  // Imatge de l'API
                  image: NetworkImage(meal.strMealThumb),

                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}