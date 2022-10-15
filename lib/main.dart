import 'package:flutter/material.dart';
import 'categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DailyMeals",
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Colors.black,
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              )),
      home: CategoriesScreen(),
    );
  }
}
