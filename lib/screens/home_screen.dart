import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final mealsProvider = Provider.of<MealsProvider>(context);

    if (mealsProvider.meals.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text('Meals App'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // CardSwiper
            CardSwiper(
              meals: mealsProvider.meals,
            ),

            // Slider
            MealSlider(
              meals: mealsProvider.meals,
            ),

          ],
        ),
      ),
    );
  }
}