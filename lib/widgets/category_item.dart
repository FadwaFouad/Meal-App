import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed( 
      CategoryMealScreen.ROUTE_NAME, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextTheme().headline1,
          //Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // colors: [
            //   color.withOpacity(0.7),
            //   color,
            // ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:  [
              color.withOpacity(0.7),
              color,
            ],

          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
