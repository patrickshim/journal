import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';

Widget textFormFieldWidget(
    BuildContext context, String name, JournalEntry entry) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      autofocus: true,
      decoration:
          InputDecoration(labelText: name, border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please complete form';
        }
        return null;
      },
      onSaved: (value) {
        if (name == 'Title') {
          entry.title = value;
        } else if (name == 'Body') {
          entry.body = value;
        }
      },
    ),
  );
}
