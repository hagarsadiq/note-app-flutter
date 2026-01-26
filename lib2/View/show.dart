import 'package:flutter/material.dart';

class Shownotes extends StatelessWidget {
  List notes;

  Shownotes({required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("notes")),
      body: ListView.builder(

        itemCount: notes.length,
        itemBuilder: (context, i) =>
            ListTile(title: Text(notes[i]),),

      ),
    );
  }
}