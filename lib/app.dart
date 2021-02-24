import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import 'package:journal/screens/journal_entry_screen.dart';
import 'package:journal/screens/new_entry_screen.dart';
import 'screens/welcome_screen.dart';

class MyApp extends StatefulWidget {
  static final routes = {
    '/': (context) => WelcomeScreen(),
    'one_entry': (context) => JournalEntryScreen(),
    'new_entry': (context) => NewEntryScreen(),
    'all_entry': (context) => JournalEntriesScreen()
  };

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isDark = false;
  bool get getIsDark => isDark;

  List<JournalEntry> entries = [];

  void updateTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      routes: MyApp.routes,
    );
  }
}
