import 'package:flutter/material.dart';
import 'package:third_project/Screen/tabsScreen.dart';
import '../Screen/meal_details_screen.dart';
import 'Screen/CategoriesMealsScreen.dart';
import 'Screen/categories_screen.dart';
import './Widgets/category_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DailyMeals",
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.pink,
          canvasColor: Colors.white,
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              )),
      home: TabsScreen(),
      routes: {
        CategoriesMealsScreen.RouteName: (ctx) => CategoriesMealsScreen(),
        MealDetailScreen.RouteName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
