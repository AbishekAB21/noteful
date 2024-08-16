import 'package:flutter/material.dart';
import 'package:noteful/methods/note_database_methods.dart';
import 'package:noteful/models/note.dart';
import 'package:noteful/utils/fontstyles.dart';
import 'package:noteful/widgets/reusable_floating_action_button.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController noteController = TextEditingController();
  // Create

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: TextField(
          controller: noteController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: Fontstyles.buttontext()),
          ),
          TextButton(
              onPressed: () {
                context.read<NoteDatabase>().addNote(noteController.text);
                Navigator.pop(context);
                noteController.clear();
              },
              child: Text("Create", style: Fontstyles.buttontext()))
        ],
      ),
    );
  }

  // Read

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // Update

  // Delete

  @override
  void initState() {
    
    super.initState();
    readNotes();
  }
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    final List<Note> currentnotes = noteDatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: ReusableFloatingActionButton(
          onpressed: createNote, imagePath: "assets/add-note.png"),
      body: ListView.builder(
        itemCount: currentnotes.length,
        itemBuilder: (context, index) {
          final note = currentnotes[index];

          return ListTile(
            title: Text(note.text),
          );
        },
      ),
    );
  }
}
