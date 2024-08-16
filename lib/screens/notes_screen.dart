import 'package:flutter/material.dart';
import 'package:noteful/methods/note_database_methods.dart';
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

  // Create

  void createNote() {
    noteController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "Add New Note",
          style: Fontstyles.buttontext2(context),
        ),
        content: TextField(
          controller: noteController,
          decoration: InputDecoration(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: Fontstyles.buttontext(context)),
          ),
          TextButton(
              onPressed: () {
                context.read<NoteDatabase>().addNote(noteController.text);
                Navigator.pop(context);
                noteController.clear();
              },
              child: Text("Create", style: Fontstyles.buttontext(context)))
        ],
      ),
    );
  }

  // Read

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // Update

  void updateNote(Note note) {
    // pre-filling the textfield
    noteController.text = note.text;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "Edit Note",
          style: Fontstyles.buttontext2(context),
        ),
        content: TextField(
          controller: noteController,
          decoration: InputDecoration(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: Fontstyles.buttontext(context)),
          ),
          TextButton(
              onPressed: () {
                context
                    .read<NoteDatabase>()
                    .updateNotes(note.id, noteController.text);
                Navigator.pop(context);
                noteController.clear();
              },
              child: Text("Update", style: Fontstyles.buttontext(context)))
        ],
      ),
    );
  }

  // Delete

  void deleteNote(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(
          "This will permenantly delete the note. Do you still want to it ?",
          style: Fontstyles.buttontext(context),
        ),
        title: Text("Think about it..", style: Fontstyles.buttontext2(context)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: Fontstyles.buttontext(context)),
          ),
          TextButton(
              onPressed: () {
                context.read<NoteDatabase>().deleteNotes(id);
                Navigator.pop(context);
              },
              child: Text("Delete", style: Fontstyles.buttontext(context)))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    readNotes();
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
          onpressed: createNote,
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

            // List of Notes
            Expanded(
              child: ListView.builder(
                itemCount: currentnotes.length,
                itemBuilder: (context, index) {
                  final note = currentnotes[index];

                  return NoteTile(
                    text: note.text,
                    onEditPressed: () => updateNote(note),
                    onDeletePressed: () => deleteNote(note.id),
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
