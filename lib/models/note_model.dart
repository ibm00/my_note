import 'package:flutter/foundation.dart';
import '../constants.dart';

class NoteModel {
  int id;
  String title;
  String noteBody;
  String date;
  NoteModel({
    this.id,
    @required this.title,
    @required this.noteBody,
    this.date,
  });

  NoteModel.mapToObject(Map<String, dynamic> noteMap) {
    id = noteMap[kIdColumn];
    title = noteMap[kTitleColumn];
    noteBody = noteMap[kNoteBodyColumn];
    date = noteMap[kDateColumn];
  }

  Map<String, dynamic> opToMap() {
    return {
      kIdColumn: id,
      kTitleColumn: title,
      kNoteBodyColumn: noteBody,
      kDateColumn: date,
    };
  }
}
