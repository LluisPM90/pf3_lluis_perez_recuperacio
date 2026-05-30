import 'package:flutter/material.dart';

// Importam Provider
import 'package:provider/provider.dart';

// Importam el provider principal de l'aplicació
import 'providers/meals_provider.dart';

// Importam les pantalles
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';

void main() {

  // Punt d'entrada principal de l'app
  runApp(const AppState());
}

// =====================================================
// AppState
// =====================================================
// Aquí inicialitzam els Providers globals.
// El Provider centralitza tota la lògica i estat
// de l'aplicació.
//
// Això és exactament el patró treballat
// a la plantilla oficial.
// =====================================================

class AppState extends StatelessWidget {

  const AppState({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        // Provider principal de l'aplicació
        ChangeNotifierProvider(
          create: (_) => MealsProvider(),
        ),

      ],

      child: const MyApp(),
    );
  }
}

// =====================================================
// MyApp
// =====================================================
// Widget principal de l'aplicació.
//
// Aquí definim:
// - tema visual
// - rutes
// - pantalla inicial
// =====================================================

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      // Eliminam banner DEBUG
      debugShowCheckedModeBanner: false,

      // Títol de l'aplicació
      title: 'Meals App',

      // Tema principal
      theme: ThemeData(

        useMaterial3: true,

        colorSchemeSeed: Colors.orange,
      ),

      // Pantalla inicial
      home: const HomeScreen(),

      // Rutes de navegació
      routes: {

        // Pantalla de detall
        'details': (_) => const DetailsScreen(),
      },
    );
  }
}