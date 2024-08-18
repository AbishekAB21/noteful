import 'package:flutter/material.dart';
import 'package:noteful/methods/note_database_methods.dart';
import 'package:noteful/models/note.dart';
import 'package:noteful/utils/fontstyles.dart';
import 'package:provider/provider.dart';


// NOTEFUL CRUD OPERATIONS FOR UI



// CREATE 

void createNote(BuildContext context, TextEditingController noteController) {
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
          child: Text("Create", style: Fontstyles.buttontext(context)),
        ),
      ],
    ),
  );
}

// READ 

void readNotes(BuildContext context) {
  context.read<NoteDatabase>().fetchNotes();
}

// UPDATE

void updateNote(
    BuildContext context, Note note, TextEditingController noteController) {
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
          child: Text("Update", style: Fontstyles.buttontext(context)),
        ),
      ],
    ),
  );
}

// DELETE

void deleteNote(BuildContext context, int id) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(
        "This will permanently delete the note. Do you still want to proceed?",
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
          child: Text("Delete", style: Fontstyles.buttontext(context)),
        ),
      ],
    ),
  );
}
