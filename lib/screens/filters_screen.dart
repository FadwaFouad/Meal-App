import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class FilttersScreen extends StatefulWidget {
  static const ROUTE_NAME = '/filtters_screen';
  final Function saveFilters;
  final Map<String, bool> filters;

  const FilttersScreen(
    this.filters,
    this.saveFilters,
  );

  @override
  _FilttersScreenState createState() => _FilttersScreenState();
}

class _FilttersScreenState extends State<FilttersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  Widget _buildFilterItem(String title, String subTitle, bool currentValue,
      Function filterHandelr) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: filterHandelr);
  }

  @override
  void initState() {
    _isGlutenFree = widget.filters['Gluten'];
    _isLactoseFree = widget.filters['Lactose'];
    _isVegan = widget.filters['Vegan'];
    _isVegetarian = widget.filters['Vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () {
                Map<String, bool> filters = {
                  'Gluten': _isGlutenFree,
                  'Lactose': _isLactoseFree,
                  'Vegan': _isVegan,
                  'Vegetarian': _isVegetarian,
                };

                widget.saveFilters(filters);
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjest your filters Meals !!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildFilterItem(
                    'Gluten - Free',
                    'only Meals that free from Gluten',
                    _isGlutenFree,
                    (value) {
                      setState(() {
                        _isGlutenFree = value;
                      });
                    },
                  ),
                  _buildFilterItem(
                    'Lactose - Free',
                    'only Meals that free from Lactose',
                    _isLactoseFree,
                    (value) {
                      setState(() {
                        _isLactoseFree = value;
                      });
                    },
                  ),
                  _buildFilterItem(
                    'Vegan - food',
                    'only Vegan Meals are selected ',
                    _isVegan,
                    (value) {
                      setState(() {
                        _isVegan = value;
                      });
                    },
                  ),
                  _buildFilterItem(
                    'Vegetarian - Food',
                    'only Vegetarian Meals are selected ',
                    _isVegetarian,
                    (value) {
                      setState(() {
                        _isVegetarian = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
