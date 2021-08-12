import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_note/database/notes_db.dart';
import '../models/note_model.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> _notes = [
    // NoteModel(
    //   id: 1,
    //   title:
    //       'Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, ',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 2,
    //   title:
    //       'Test note, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, ',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 3,
    //   title:
    //       'Test note, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, ',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 4,
    //   title:
    //       'Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, ',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 5,
    //   title:
    //       'Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, ',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 6,
    //   title:
    //       'Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, Test note title, ttttttttt, ttttttt',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 7,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 8,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 9,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 10,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 11,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 12,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 13,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 14,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 15,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 16,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 17,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 18,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
    // NoteModel(
    //   id: 19,
    //   title: 'Test note',
    //   noteBody:
    //       'This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, This is the body of my test note, ',
    //   date: DateFormat.yMMMd().format(DateTime.now()),
    // ),
  ];

  Future<void> initializeData() async {
    NoteDatabase db = NoteDatabase.db;
    _notes = await db.dbReadAllNotes();
    notifyListeners();
  }

  List<NoteModel> get notes {
    return [..._notes];
  }

  int get notesCount {
    return _notes.length;
  }

  Future<void> addNote(NoteModel note) async {
    NoteDatabase db = NoteDatabase.db;
    String _date = DateFormat.yMMMd().format(DateTime.now());

    int _id = await db.dbAddNote(NoteModel(
      title: note.title,
      noteBody: note.noteBody,
      date: _date,
    ));

    _notes.insert(
      0,
      NoteModel(
        id: _id,
        title: note.title,
        noteBody: note.noteBody,
        date: DateFormat.yMMMd().format(DateTime.now()),
      ),
    );
    print('data added');
    notifyListeners();
  }

  Future<void> updateNote(NoteModel note) async {
    int i = _notes.indexWhere((n) => n.id == note.id);
    if (i < 0) return;
    NoteDatabase db = NoteDatabase.db;

    await db.dbUpdateNote(note);

    _notes[i] = note;
    print('data updated');
    notifyListeners();
  }

  Future<void> deleteNote(int id) async {
    NoteDatabase db = NoteDatabase.db;

    await db.dbDeleteNote(id);

    _notes.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
