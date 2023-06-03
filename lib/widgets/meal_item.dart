import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_info.dart';
import 'package:transparent_image/transparent_image.dart';
import 'meal_item_metadata.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meals,});

  final List<Meal> meals;
  void _selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: 
    (ctx){
      return MealInfo(meal: meal);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            splashColor: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(8),
            onTap: () {
                _selectMeal(context, meals[index]);
                }
            ,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                clipBehavior: Clip.hardEdge,
                elevation: 2,
                child: Stack(
                  children: [
                    FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meals[index].imageUrl),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              meals[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MealItemDetails(
                                    icon: Icons.alarm,
                                    detail:
                                        '${meals[index].duration.toString()} min'),
                                const SizedBox(
                                  width: 10,
                                ),
                                MealItemDetails(
                                    icon: Icons.work,
                                    detail:
                                        '${meals[index].complexity.name[0].toUpperCase() + meals[index].complexity.name.substring(1)}'),
                                const SizedBox(
                                  width: 10,
                                ),
                                MealItemDetails(
                                    icon: Icons.monetization_on_sharp,
                                    detail:
                                        '${meals[index].affordability.name[0].toUpperCase() + meals[index].affordability.name.substring(1)}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
