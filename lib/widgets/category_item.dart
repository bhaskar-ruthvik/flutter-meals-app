import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  const CategoryItem({super.key, required this.category, required this.onTapFunction});

  final Category category;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return
     InkWell(
      onTap: () {
        onTapFunction();
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(14.0),
       child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,) 
          ),
          child: Text(category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground
          ),
          ),
         ),
     )
    ;
  }
}