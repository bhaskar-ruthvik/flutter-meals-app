import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/filters.dart';
class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key,required this.setScreen});
  final void Function() setScreen;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 158, 24, 24).withOpacity(0.55),
                  Color.fromARGB(255, 158, 24, 24).withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,),
            ),
            child: Row(children: [
                const Icon(Icons.cookie,
                size: 40,),
                const SizedBox(width: 10),
                Text('Lets get Cooking!',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white
                ),)
            ],),
          ),
          ListTile(
            onTap: (){
                Navigator.of(context).pop();
            },
            leading: Icon(Icons.restaurant,size: 26,color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text('Meals',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onPrimaryContainer
            ),)
          ),
          ListTile(
            onTap: setScreen,
            leading: Icon(Icons.settings,size: 26,color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text('Filters',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onPrimaryContainer
            ),)
          ),
        ],
      ),
    );
  }
}