import 'package:flutter/material.dart';
import 'package:meal_recipe_app/screens/category_screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              'Category',
              style: TextStyle(
                  color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
            )),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: const CategoryScreen(),
    );
  }
}
