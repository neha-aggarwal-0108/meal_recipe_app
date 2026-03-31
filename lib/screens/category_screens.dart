import 'package:flutter/material.dart';
import 'package:meal_recipe_app/data/category_data.dart';

// import 'package:meal_recipe_app/models/category_model.dart';
import 'package:meal_recipe_app/screens/meals_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 0.4), end: const Offset(0, 0))
              .animate(CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut)),
          child: child,
        );
      },
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          padding: const EdgeInsets.all(20),
          children: List.generate(categories.length, (index) {
            return InkWell(
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MealsScreen(
                                title: categories[index].title,
                                catId: categories[index].id)));
                // print(categories[index].title);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                // color: categories[index].color,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        categories[index].color.withOpacity(0.5),
                        categories[index].color.withOpacity(0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                child: Text(
                  categories[index].title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );
          })),
    );
  }
}
