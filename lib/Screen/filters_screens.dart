import 'package:flutter/material.dart';
import '/Widgets/main_Drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const RouteName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      onChanged: updateValue(),
      value: currentValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filter'),
        ),
        drawer: MainDrawer(),
        body: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.lightBlue, Colors.white])),
            child: Column(
              children: <Widget>[
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
                        _gluteenFree, (newValue) {
                      setState(() {
                        _gluteenFree = newValue;
                      });
                    }),
                    _buildSwitchTile(
                        'LactoseFree',
                        'only LactoseFree Meals include ',
                        _lactoseFree, (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    })
                  ],
                )),
                _buildSwitchTile(
                    'Vegetarian', 'only Vegetarian Meals include ', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTile('vegan', 'only vegan Meals include ', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            )));
  }
}
