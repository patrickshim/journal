import 'package:flutter/material.dart';
import 'package:journal/components/drawer_widget.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        //https://stackoverflow.com/questions/43981406/how-to-center-the-title-of-an-appbar
        centerTitle: true,
        title: Text('Welcome'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              _openEndDrawer();
            },
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Icon(Icons.book, size: 80), Text('Journal')])
      ),
      endDrawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'new_entry');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
