import 'package:flutter/material.dart';
import 'package:noteful/methods/note_database_methods.dart';
import 'package:noteful/methods/note_ui_methods.dart';
import 'package:noteful/models/note.dart';
import 'package:noteful/utils/fontstyles.dart';
import 'package:noteful/widgets/note_tile.dart';
import 'package:noteful/widgets/reusable_drawrer.dart';
import 'package:noteful/widgets/reusable_floating_action_button.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes(context); 
  }

  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    final List<Note> currentnotes = noteDatabase.currentNotes;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: Mydrawrer(),
        floatingActionButton: ReusableFloatingActionButton(
          onpressed: () => createNote(context, noteController), 
          icon: Icon(
            Icons.note_alt_rounded,
            size: 50,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading

            Text(
              "Notes",
              style: Fontstyles.boldtextMerriweatherSans(context),
            ),

            SizedBox(
              height: 20,
            ),

            // Search Option
            //SearchBox(),

            // SizedBox(
            //   height: 20,
            // ),

            // List of Notes
            Expanded(
              child: ListView.builder(
                itemCount: currentnotes.length,
                itemBuilder: (context, index) {
                  final note = currentnotes[index];

                  return NoteTile(
                    text: note.text,
                    onEditPressed: () => updateNote(context, note, noteController), 
                    onDeletePressed: () => deleteNote(context, note.id), 
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
