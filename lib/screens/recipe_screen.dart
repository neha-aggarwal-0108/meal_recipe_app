import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/models/meals_model.dart';
import 'package:meal_recipe_app/providers/favourites_provider.dart';

class RecipeScreen extends ConsumerWidget {
  final MealsModel meal;

  const RecipeScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MealsModel> favouriteMeals = ref.watch(favMealProvider);
    final bool isFav = favouriteMeals.contains((meal));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            meal.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          actions: [
            IconButton(
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
              color: isFav ? Colors.red : Colors.white,
              onPressed: () {
                ref.read(favMealProvider.notifier).toggleMealFavStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(isFav
                      ? 'Removed from Favourites'
                      : 'Added to Favourites'),
                  elevation: 3,
                  backgroundColor: isFav ? Colors.red : Colors.green,
                ));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Ingredients ',
                  style: TextStyle(fontSize: 24, color: Colors.redAccent),
                ),
                ...meal.ingredients.map((item) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Steps ',
                  style: TextStyle(fontSize: 24, color: Colors.redAccent),
                ),
                ...meal.steps.map((item) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 10,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
