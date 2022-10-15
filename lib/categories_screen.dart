import 'package:flutter/material.dart';
import 'package:third_project/Dummy_Data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DailyMeals"),
      ),
      body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORY
              .map(
                (catData) => CategoryItem(catData.title, catData.color),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
