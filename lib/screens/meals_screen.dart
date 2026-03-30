import 'package:flutter/material.dart';
import 'package:meal_recipe_app/data/meals_data.dart';
import 'package:meal_recipe_app/models/meals_model.dart';
import 'package:meal_recipe_app/screens/recipe_screen.dart';
import 'package:meal_recipe_app/widgets/item_trait.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final String catId;

  const MealsScreen({super.key, required this.title, required this.catId});


  @override
  Widget build(BuildContext context) {
    List<MealsModel> filteredMeals = meals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
        ),
        body: ListView.builder(
            itemCount: filteredMeals.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeScreen(meal: filteredMeals[index],)));
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.hardEdge,
                    elevation: 2,
                    child: Stack(
                      children: [
                        Image.network(
                          filteredMeals[index].imageUrl,
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
                                Text(filteredMeals[index].title,
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
                                      text: filteredMeals[index]
                                          .duration
                                          .toString(),
                                    ),
                                    // const SizedBox(
                                    //   width: 5,
                                    // ),
                                    ItemTrait(
                                      icon: Icons.work,
                                      text:
                                      filteredMeals[index].complexity.name,
                                    ),
                                    // const SizedBox(
                                    //   width: 5,
                                    // ),
                                    ItemTrait(
                                      icon: Icons.attach_money,
                                      text: filteredMeals[index]
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
