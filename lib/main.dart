import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/bottom_nav_screen.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './models/Meal.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoritsMeals = [];

  void _saveFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['Gluten'] && !meal.isGlutenFree) return false;
        if (_filters['Lactose'] && !meal.isLactoseFree) return false;
        if (_filters['Vegan'] && !meal.isVegan) return false;
        if (_filters['Vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  bool isFavorit(String mealId) =>
      favoritsMeals.any((meal) => meal.id == mealId);

  void saveFavorits(String mealId) {
    if (favoritsMeals.any((meal) => meal.id == mealId))
      setState(() {
        favoritsMeals.removeWhere((meal) => meal.id == mealId);
      });
    else {
      setState(() {
        favoritsMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amber,
        primaryColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
        ),
      ),
      title: 'DeliMeal',
      //home: CategoriesScreen(),
      routes: {
        '/': (_) => BottomNavScreen(favoritsMeals),
        CategoryMealScreen.ROUTE_NAME: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.ROUTE_NAME: (ctx) => MealDetailScreen(
              saveFavorits,
              isFavorit,
            ),
        FilttersScreen.ROUTE_NAME: (ctx) =>
            FilttersScreen(_filters, _saveFilters),
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
