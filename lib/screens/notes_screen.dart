import 'package:flutter/material.dart';
import 'package:noteful/widgets/reusable_floating_action_button.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        floatingActionButton: ReusableFloatingActionButton(
            onpressed: () {}, imagePath: "assets/add-note.png"));
  }
}
