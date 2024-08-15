
import 'package:isar/isar.dart';
import 'package:noteful/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase{ 

  static late Isar isar;

  final List<Note> currentNotes = [];

  // INITIALIZE DATABASE 

  static Future<void> initialize() async{

    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // CREATE 

  Future<void> addNote (String textFromUser) async{
    final newNote = Note()..text = textFromUser; // cascading 

    // Saving to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    fetchNotes();
  }

  // READ 

  Future<void> fetchNotes() async{
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
  }

  // UPDATE

  Future<void> updateNotes (int id, String newText) async{

    final existingNote = await isar.notes.get(id); // gets existing note using id
    if(existingNote!=null){

      existingNote.text = newText; // if existing note exists then new text is given to it
      await isar.writeTxn(() => isar.notes.put(existingNote)); // new text replaces the old using put()
      await fetchNotes(); // calls fetch notes again to read and return the updated data 
    }
  }

  // DELETE

  Future<void> deleteNotes (int id) async{

    await isar.writeTxn(() => isar.notes.delete(id)); // deleted using id
    await fetchNotes();
  }
}


/* 

##-- FOR REFFERENCE --##

The writeTxn() is not used to write data into the database. Consider it like a
method to get into the database from where we can access various other methods
like Put() -> for writing data, Get() -> for fetching dara, delete() -> for
deleting data.


*/