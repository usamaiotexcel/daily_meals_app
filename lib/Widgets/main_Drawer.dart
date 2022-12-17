import 'package:flutter/material.dart';
import 'package:third_project/Screen/filters_screens.dart';
import 'package:flutter/cupertino.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, final tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.pink,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue, Colors.pink])),
              child: SizedBox(
                height: 20,
              ),
            ),
            buildListTile('Meals', Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            buildListTile('Filters', Icons.settings, () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.RouteName);
            }),
          ],
        ),
      ),
    );
  }
}
