import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.meals});
  

  final List<Meal> meals;
  void _goToScreen(BuildContext context,Category category) {
    final filteredMeals = meals.where((element) {
       return element.categories.contains(category.id);}
    ).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(title: category.title, meals: filteredMeals,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              ...availableCategories.map((category) => CategoryItem(
                    category: category,
                    onTapFunction: () {
                      _goToScreen(context,category);
                    },
                  ))
            ],
          ),
        );
  }
}
