import 'package:first/widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Meal.dart';

class FavoritsScreen extends StatelessWidget {
  final List<Meal> favoritsMeals;
  FavoritsScreen(this.favoritsMeals);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoritsMeals.isEmpty
          ? Center(
              child: Text(
              'No Favorits yet !! ',
              style: Theme.of(context).textTheme.headline1,
            ))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  affordability: favoritsMeals.elementAt(index).affordability,
                  complexity: favoritsMeals.elementAt(index).complexity,
                  duration: favoritsMeals.elementAt(index).duration,
                  id: favoritsMeals.elementAt(index).id,
                  imageUrl: favoritsMeals.elementAt(index).imageUrl,
                  title: favoritsMeals.elementAt(index).title,
                );
              },
              itemCount: favoritsMeals.length),
    );
  }
}
