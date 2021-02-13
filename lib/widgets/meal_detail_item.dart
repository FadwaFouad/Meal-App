import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailItem extends StatelessWidget {
  final String mealId;

  const MealDetailItem(this.mealId);

  Widget buildTextTitle(BuildContext ctx, String title) {
    return Text(
      title,
      style: Theme.of(ctx).textTheme.headline1,
    );
  }

  Widget buildListContainer({Widget child}) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
        width: 2,
        color: Colors.grey,
      )),
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 40,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealData = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              child: Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTextTitle(context, 'Ingredients'),
            buildListContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  margin: EdgeInsets.all(5),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    mealData.ingredients.elementAt(index),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                itemCount: mealData.ingredients.length,
              ),
            ),
            buildTextTitle(context, 'Steps'),
            buildListContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(mealData.steps.elementAt(index)),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: mealData.steps.length,
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
