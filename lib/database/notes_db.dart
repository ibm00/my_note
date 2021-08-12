import 'package:my_note/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../constants.dart';

class NoteDatabase {
  NoteDatabase._();
  static final NoteDatabase db = NoteDatabase._();

  static Database _notesDatabase;

  Future<Database> get notesDatabase async {
    if (_notesDatabase != null) {
      return _notesDatabase;
    } else {
      _notesDatabase = await initDB();
      return _notesDatabase;
    }
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'NotesData.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE $kTable(
          $kIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, 
          $kTitleColumn TEXT NOT NULL,
          $kNoteBodyColumn TEXT NOT NULL,
          $kDateColumn TEXT NOT NULL)
          ''');
      },
    );
  }

  Future<int> dbAddNote(NoteModel note) async {
    var _db = await notesDatabase;

    return await _db.insert(kTable, note.opToMap());
  }

  Future<void> dbUpdateNote(NoteModel note) async {
    var _db = await notesDatabase;
    await _db.update(kTable, note.opToMap(),
        where: '$kIdColumn = ?', whereArgs: [note.id]);
  }

  Future<NoteModel> dbReadNote(int id) async {
    var _db = await notesDatabase;
    var _mapList =
        await _db.query(kTable, where: '$kIdColumn', whereArgs: [id]);
    return (_mapList.isEmpty) ? null : NoteModel.mapToObject(_mapList.first);
  }

  Future<List<NoteModel>> dbReadAllNotes() async {
    var _db = await notesDatabase;
    var _mapList = await _db.query(kTable);
    return (_mapList.isEmpty)
        ? []
        : _mapList.map((e) => NoteModel.mapToObject(e)).toList();
  }

  Future<void> dbDeleteNote(int id) async {
    var _db = await notesDatabase;
    _db.delete(kTable, where: '$kIdColumn = ?', whereArgs: [id]);
  }
}
