import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/screens/filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favourites_provider.dart';

const kFilterMap ={
    Filters.glutenFree : false,
    Filters.lactoseFree : false,
    Filters.vegetarian : false,
    Filters.vegan : false
  };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _currentItemIndex = 0;
  Widget? contentWidget;
  String title = 'Categories';
  Map<Filters,bool> filterMap = kFilterMap;
  void setScreen() async{
    Navigator.of(context).pop();
              final result = ref.watch(filterProvider);
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx){
                  return FiltersScreen();
              }));
            setState(() {
              filterMap = result;
            });
  }
  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(mealsProvider).where((m){
      if(filterMap[Filters.glutenFree]! && !m.isGlutenFree){
          return false;
      }
      if(filterMap[Filters.lactoseFree]! && !m.isLactoseFree){
        return false;
      }
      if(filterMap[Filters.vegetarian]! && !m.isVegetarian){
        return false;
      }
      if(filterMap[Filters.vegan]! && !m.isVegan){
        return false;
      }
      return true;
    }).toList();
     if(_currentItemIndex== 1){
        final favouriteMeals = ref.watch(favouriteMealsProvider);
        setState(() {
          title = 'Your Favourites';
          contentWidget = MealsScreen(meals: favouriteMeals,);
        });
              
            }
    else{
      setState(() {
        title = 'Categories';
        contentWidget = CategoriesScreen(meals: availableMeals,);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(setScreen: setScreen,),
      body: contentWidget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentItemIndex=index;
            print(_currentItemIndex);
           
          });
        },
        currentIndex: _currentItemIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favourites'),
        ],
      ),
    );
  }
}
