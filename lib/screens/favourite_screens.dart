import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/models/meals_model.dart';
import 'package:meal_recipe_app/providers/favourites_provider.dart';
import 'package:meal_recipe_app/screens/recipe_screen.dart';

import '../widgets/item_trait.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MealsModel> favouriteMeals = ref.watch(favMealProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Favourite Meals',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
        ),
        body: favouriteMeals.isEmpty
            ? const Center(child: Text('No Favourites yet',style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),))
            : ListView.builder(
            itemCount: favouriteMeals.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeScreen(
                                  meal: favouriteMeals[index],
                                )));
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.hardEdge,
                    elevation: 2,
                    child: Stack(
                      children: [
                        Image.network(
                          favouriteMeals[index].imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            color: Colors.black54,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 44, vertical: 6),
                            child: Column(
                              children: [
                                Text(favouriteMeals[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white)),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ItemTrait(
                                      icon: Icons.schedule,
                                      text: favouriteMeals[index]
                                          .duration
                                          .toString(),
                                    ),
                                    // const SizedBox(
                                    //   width: 5,
                                    // ),
                                    ItemTrait(
                                      icon: Icons.work,
                                      text: favouriteMeals[index]
                                          .complexity
                                          .name,
                                    ),
                                    // const SizedBox(
                                    //   width: 5,
                                    // ),
                                    ItemTrait(
                                      icon: Icons.attach_money,
                                      text: favouriteMeals[index]
                                          .affordability
                                          .name,
                                    ),
                                    // const SizedBox(
                                    //   width: 5,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
