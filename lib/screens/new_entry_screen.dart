import 'package:flutter/material.dart';
import 'package:journal/widgets/journal_form.dart';

class NewEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //https://stackoverflow.com/questions/43981406/how-to-center-the-title-of-an-appbar 
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Journal Entry')
      ),
      body: JournalForm(),
    );
  }
}