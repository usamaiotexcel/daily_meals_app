import 'package:flutter/material.dart';
import '/Widgets/main_Drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const RouteName = '/filters';
  final saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _gluteenFree = widget.currentFilters['gluten'] == true;
    _lactoseFree = widget.currentFilters['lactose'] == true;
    _vegan = widget.currentFilters['vegan'] == true;
    _vegetarian = widget.currentFilters['vegetarian'] == true;
    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    var updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onChanged: updateValue,
      value: currentValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filter'), actions: <Widget>[
        IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _gluteenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save))
      ]),
      drawer: MainDrawer(),
      body: Container(
          margin: EdgeInsets.all(00),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.white, Colors.blue])),
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal Selection!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'GluteenFree',
                  'only gluteenFree Meals include ',
                  _gluteenFree,
                  (newValue) {
                    setState(
                      () {
                        _gluteenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'LactoseFree',
                  'only LactoseFree Meals include ',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'only Vegetarian Meals include ',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Vegan',
                  'only vegan Meals include ',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ))
          ])),
    );
  }
}
