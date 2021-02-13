import 'package:first/screens/filters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget buildDrawerItem({
    BuildContext context,
    IconData icon,
    String title,
    Function selectHandler,
  }) {
    return Container(
      width: double.infinity,
      height: 70,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        onTap: selectHandler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Cooking Up',
              style: Theme.of(context).textTheme.headline1,
            ),
            color: Theme.of(context).accentColor,
          ),
          buildDrawerItem(
              context: context,
              title: 'Meals',
              icon: Icons.restaurant,
              selectHandler: () =>
                  Navigator.of(context).pushReplacementNamed('/')),
          buildDrawerItem(
              context: context,
              title: 'Setting',
              icon: Icons.settings,
              selectHandler: () => Navigator.of(context)
                  .pushReplacementNamed(FilttersScreen.ROUTE_NAME)),
        ],
      ),
    );
  }
}
