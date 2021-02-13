import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/category_meal';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> _categoryMeals;
  String _categoryTitle;
  var _isInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      _categoryTitle = routeArgs['title'];
      _categoryMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _isInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String id) {
  //   setState(() {
  //     _categoryMeals.removeWhere((meal) => meal.id == id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordability: _categoryMeals.elementAt(index).affordability,
              complexity: _categoryMeals.elementAt(index).complexity,
              duration: _categoryMeals.elementAt(index).duration,
              id: _categoryMeals.elementAt(index).id,
              imageUrl: _categoryMeals.elementAt(index).imageUrl,
              title: _categoryMeals.elementAt(index).title,
            );
          },
          itemCount: _categoryMeals.length),
    );
  }
}
