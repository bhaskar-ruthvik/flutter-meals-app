import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/screens/meal_info.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;
 
 
  @override
  Widget build(BuildContext context) {
      Widget mainContent = Center(
    child: Column(
      mainAxisSize: MainAxisSize.min ,
      children: [
        Text(
          'Uh Oh! Nothing here',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
         const SizedBox(height: 20),
         Text(
          'Please try another category...',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    ),
  );
    if (meals.isNotEmpty) {
      mainContent = MealItem(meals: meals);
    }
    return title==null ? mainContent :Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: mainContent,
    );
  }
}
