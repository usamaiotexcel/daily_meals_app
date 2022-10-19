import 'package:flutter/material.dart';
import '../Dummy_Data.dart';
import '../Widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DailyMeals"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.white])),
        child: GridView(
            padding: const EdgeInsets.all(25),
            children: DUMMY_CATEGORIES
                .map(
                  (catData) =>
                      CategoryItem(catData.title, catData.color, catData.id),
                )
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20)),
      ),
    );
  }
}
