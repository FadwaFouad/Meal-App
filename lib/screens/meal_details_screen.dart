import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_detail_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/meal_detail';
  final Function saveFavorits;
  final Function isFavorite;
  MealDetailScreen(this.saveFavorits, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealData = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(title: Text('${mealData.title}')),
      body: MealDetailItem(mealId),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealId) ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border),
        onPressed: () => saveFavorits(mealId),
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
