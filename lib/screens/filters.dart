import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget{
  FiltersScreen({super.key});
  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen>{
    var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  
  @override
  void initState() {
    
    super.initState();
    final filters = ref.read(filterProvider);
    
      _isGlutenFree = filters[Filters.glutenFree]!;
      _isLactoseFree = filters[Filters.lactoseFree]!;
      _isVegetarian = filters[Filters.vegetarian]!;
      _isVegan = filters[Filters.vegan]!;
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filterProvider.notifier).setFilters({
            Filters.glutenFree: _isGlutenFree,
            Filters.lactoseFree: _isLactoseFree,
            Filters.vegetarian: _isVegetarian,
            Filters.vegan: _isVegan,
            
          });
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(value: _isGlutenFree,
            onChanged: (tileStat){
              setState(() {
                _isGlutenFree = tileStat;
              });
                
            },
            title: Text('Gluten Free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white
            ),),
            subtitle: Text('Shows only meals that are gluten-free',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white
            ),),
            ),
            SwitchListTile(value: _isLactoseFree,
            onChanged: (tileStat){
              setState(() {
                 _isLactoseFree = tileStat;
              });
               
            },
            title: Text('Lactose Free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white
            ),),
            subtitle: Text('For the Lactose-Intolerant people out there.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white
            ),),
            ),
            SwitchListTile(value: _isVegetarian,
            onChanged: (tileStat){
              setState(() {
                _isVegetarian = tileStat;
              });
      
            },
            title: Text('Vegetarian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white
            ),),
            subtitle: Text('Shows only meals that are vegetarian.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white
            ),),
            ),
            SwitchListTile(value: _isVegan,
            onChanged: (tileStat){
              setState(() {
                _isVegan = tileStat;
              });
                
            },
            title: Text('Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white
            ),),
            subtitle: Text('Shows only meals that are vegan.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white
            ),),
            )
          ],
        ),
      ),
    );
  }
}