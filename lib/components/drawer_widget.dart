import 'package:flutter/material.dart';
import 'package:journal/app.dart';

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    //https://api.flutter.dev/flutter/widgets/BuildContext/findAncestorStateOfType.html
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();

    return Drawer(
        child: ListView(children: <Widget>[
      SizedBox(
        height: 50,
        child: DrawerHeader(child: Text('Settings')),
      ),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(16), child: Text('Dark Theme:')),
          Switch(
              value: appState.getIsDark,
              onChanged: (value) {
                setState(() {
                  appState.updateTheme();
                });
              }),
        ],
      )
    ]));
  }
}

class DrawerWidget extends StatefulWidget {
  final void Function() updateTheme;
  DrawerWidget({this.updateTheme});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}
