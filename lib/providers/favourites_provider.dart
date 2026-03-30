import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipe_app/models/meals_model.dart';

class FavouritesMealsModifier extends StateNotifier<List<MealsModel>> {
  FavouritesMealsModifier() : super([]);

  // update isfavourite value
  bool toggleMealFavStatus(MealsModel meal) {
    bool isMealFav = state.contains(meal);
    if (isMealFav) {
      state = state.where((m) => meal.id != m.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favMealProvider =
    StateNotifierProvider<FavouritesMealsModifier, List<MealsModel>>((ref) {
  return FavouritesMealsModifier();
});
