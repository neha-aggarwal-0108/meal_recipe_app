import 'package:flutter/material.dart';
// import 'package:meal_recipe_app/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_recipe_app/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 182, 17, 62)),
          textTheme: GoogleFonts.latoTextTheme(),
          scaffoldBackgroundColor: Colors.black),
      title: 'Meal Recipe App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
