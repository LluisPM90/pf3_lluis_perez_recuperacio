import 'package:flutter/material.dart';

// Importam el model Meal
import '../models/meal.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebem el Meal enviat des dels widgets
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ==================================================
          // AppBar amb imatge gran
          // ==================================================
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                meal.strMeal,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              background: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(meal.strMealThumb),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ==================================================
          // Informació del plat
          // ==================================================
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categoria
                    Text(
                      'Categoria',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      meal.strCategory,
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 25),

                    // País / Àrea
                    Text(
                      'Origen',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      meal.strArea,
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 25),

                    // Instruccions
                    Text(
                      'Instruccions',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      meal.strInstructions,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
