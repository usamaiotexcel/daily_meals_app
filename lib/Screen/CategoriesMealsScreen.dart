// import 'package:flutter/material.dart';
// import '../Widgets/meal_item.dart';
// import '../Dummy_Data.dart';
// import '../models/meals.dart';

// class CategoriesMealsScreen extends StatefulWidget {
//   static const RouteName = '/category_meals';

//   @override
//   _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
// }

// class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
//   String? categoryTitle;
//     List<Meal> displayedMeals;
//   var _LoadedInitData = false;

//   @override
//   void didChangeDependencies() {
//     if (!_LoadedInitData) {}
//     final routeArgs =
//         ModalRoute.of(context)!.settings.arguments as Map<String, String>;
//     final categoryTitle = routeArgs['title'];
//     final categoryId = routeArgs['id'];
//     displayedMeals = DUMMY_MEALS.where((meal) {
//       return meal.categories.contains(categoryId);
//     }).toList();
//     _LoadedInitData = true;
//     super.didChangeDependencies();
//   }

//   void _removeMeal(String mealId) {
//     setState(() {
//       displayedMeals.removeWhere((meal) => meal.id == mealId);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle!),
//       ),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return MealItem(
//             id: displayedMeals[index].id,
//             title: displayedMeals[index].title,
//             imageUrl: displayedMeals[index].imageUrl,
//             duration: displayedMeals[index].duration,
//             complexity: displayedMeals[index].complexity,
//             affordability: displayedMeals[index].affordability,
//             removeItem: _removeMeal,
//           );
//         },
//         itemCount: displayedMeals.length,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const RouteName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoriesMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            affordability: displayedMeals![index].affordability,
            complexity: displayedMeals![index].complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
