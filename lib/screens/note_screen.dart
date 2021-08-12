import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/notes_provider.dart';

import '../models/note_model.dart';

class NoteScreen extends StatefulWidget {
  static const String routeName = '/note-screen';

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteModel _note = NoteModel(id: 0, title: '', noteBody: '');
  int id;
  bool isInit = true;
  bool isTyped = false;
  bool isEdit = false;
  final _noteBodyFocuseNode = FocusNode();
  var _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _noteBodyController = TextEditingController();
  @override
  void didChangeDependencies() {
    if (isInit) {
      id = ModalRoute.of(context).settings.arguments as int;

      if (id != null) {
        isEdit = true;
        var _noteDate = Provider.of<NoteProvider>(context, listen: false);
        _note = _noteDate.notes.firstWhere((element) => element.id == id);
        _titleController.text = _note.title;
        _noteBodyController.text = _note.noteBody;
        showSaveButton();
      }
      super.didChangeDependencies();
      isInit = false;
    }
  }

  void saveData() async {
    _formKey.currentState.save();
    var _noteDate = Provider.of<NoteProvider>(context, listen: false);
    if (!isEdit) {
      await _noteDate.addNote(_note);
    } else {
      await _noteDate.updateNote(_note);
    }
    Navigator.of(context).pop();
  }

  void showSaveButton() {
    if (_titleController.text.isNotEmpty ||
        _noteBodyController.text.isNotEmpty) {
      setState(() {
        isTyped = true;
      });
    } else {
      setState(() {
        isTyped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Notepad',
          style: TextStyle(fontSize: 27),
        ),
        actions: [
          !isTyped
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 8.0, right: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      saveData();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 19),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF3B3B3B),
                      ),
                    ),
                  ),
                )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 2,
                controller: _titleController,
                onChanged: (_) {
                  showSaveButton();
                },
                style: TextStyle(color: Colors.white, fontSize: 24),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 26,
                    color: Color(0xFF919191),
                  ),
                ),
                onSaved: (value) {
                  _note = NoteModel(
                    date: _note.date,
                    id: _note.id,
                    title: value,
                    noteBody: _note.noteBody,
                  );
                },
              ),
              SizedBox(
                height: 2,
              ),
              TextFormField(
                focusNode: _noteBodyFocuseNode,
                maxLines: 30,
                controller: _noteBodyController,
                onChanged: (_) {
                  showSaveButton();
                },
                style: TextStyle(color: Colors.grey[400], fontSize: 20),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'Type something...',
                  hintStyle: TextStyle(
                    fontSize: 19,
                    color: Color(0xFF919191),
                  ),
                ),
                onSaved: (value) {
                  _note = NoteModel(
                    date: _note.date,
                    id: _note.id,
                    title: _note.title,
                    noteBody: value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
