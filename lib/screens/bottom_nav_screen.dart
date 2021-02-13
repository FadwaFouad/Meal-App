import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorits_screen.dart';
import '../models/Meal.dart';
import '../widgets/app_drawer.dart';

class BottomNavScreen extends StatefulWidget {
  final List<Meal> favoritsMeals ;
  BottomNavScreen(this.favoritsMeals);
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var _pages;
  int _pageIndex = 0;
  
  void selectTap(index) {
    setState(() {
      _pageIndex = index;
    });
  }

@override
  void initState() {
 _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Meals',
    },
    {
      'page': FavoritsScreen(widget.favoritsMeals),
      'title': 'Favorits',
    },
  ];    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_pageIndex]['title'])),
      drawer: AppDrawer(),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar:
          BottomNavigationBar(onTap: selectTap, currentIndex: _pageIndex,
              //backgroundColor: Theme.of(context).primaryColor,
              items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorits'),
            ),
          ]),
    );
  }
}
