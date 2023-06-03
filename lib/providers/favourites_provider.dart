import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal){
    final isPresent = state.contains(meal);
    if(isPresent){
      state = state.where((element){
        if(element.id == meal.id){
          return false;
        }
        return true;
        }
        
      ).toList();
      return false;
  }
  else{
    state = [...state,meal];
    return true;
  }

}}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref){
  return FavouriteMealsNotifier();
});