import 'package:flutter/material.dart';
import 'package:journal/widgets/textformfield_widget.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/app.dart';
import 'package:jiffy/jiffy.dart';

class JournalForm extends StatefulWidget {
  @override
  _JournalForm createState() => _JournalForm();
}

class _JournalForm extends State<JournalForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntry = JournalEntry();

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          textFormFieldWidget(context, 'Title', journalEntry),
          textFormFieldWidget(context, 'Body', journalEntry),
          Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(children: <Widget>[
                TextFormField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Rating',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please complete form';
                      }
                      if (int.parse(value) < 1 || int.parse(value) > 4) {
                        return 'Rating must be 1-4';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      journalEntry.rating = int.parse(value);
                    })
              ])),
          //https://stackoverflow.com/questions/54508215/mainaxisalignment-spaceevenly-not-working
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            RaisedButton(
              onPressed: () {
                //https://pub.dev/packages/jiffy
                var now = Jiffy().yMMMMd;
                if (formKey.currentState.validate()) {
                  journalEntry.date = now;
                  formKey.currentState.save();
                  appState.entries.add(journalEntry);
                  Navigator.pushNamed(context, 'all_entry');
                }
              },
              child: Text('Save'),
            ),
          ])
        ]),
      ),
    );
  }
}
