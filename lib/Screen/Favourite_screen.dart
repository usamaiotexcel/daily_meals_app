import 'package:flutter/material.dart';
import 'package:third_project/models/meals.dart';
import '../Widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavouriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.white])),
        child: Center(
          child: Text(
            'You have no favorites yet -Start adding some!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals![index].id,
            title: favoriteMeals![index].title,
            imageUrl: favoriteMeals![index].imageUrl,
            duration: favoriteMeals![index].duration,
            affordability: favoriteMeals![index].affordability,
            complexity: favoriteMeals![index].complexity,
          );
        },
        itemCount: favoriteMeals!.length,
      );
    }
  }
}
