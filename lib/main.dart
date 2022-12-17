import 'package:flutter/material.dart';
import 'Dummy_Data.dart';
import 'package:third_project/models/meals.dart';
import './Screen/filters_screens.dart';
import './Screen/tabsScreen.dart';
import './Screen/meal_details_screen.dart';
import './Screen/CategoriesMealsScreen.dart';
import './Screen/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == false && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == false && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == false && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == false && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _togglefavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isMealfavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoriesMealsScreen.RouteName: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.RouteName: (ctx) =>
            MealDetailScreen(_togglefavorite, isMealfavorite),
        FiltersScreen.RouteName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
