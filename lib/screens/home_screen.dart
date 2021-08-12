import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/notes_provider.dart';

import '../screens/note_screen.dart';
import '../widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isInit = true;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      await Provider.of<NoteProvider>(context).initializeData();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var _noteProvider = Provider.of<NoteProvider>(context);
    var _noteList = _noteProvider.notes;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Notes',
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: _noteList.isEmpty
            ? Center(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    'No notes added yet,\n      Add your own now...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 25),
                  ),
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: StaggeredGridView.countBuilder(
                  itemCount: _noteProvider.notesCount,
                  crossAxisCount: 4,
                  itemBuilder: (context, i) {
                    return NoteItem(
                      id: _noteList[i].id,
                      title: _noteList[i].title,
                      date: _noteList[i].date,
                      index: i,
                      hight: getHieght(i),
                      width: getWidth(i),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                    getWidth(index),
                    getHieght(index) * 1.0,
                  ),
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NoteScreen.routeName);
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }

  int getHieght(int i) {
    return (((i.isEven || i == 1 || i == 7) &&
            (i != 0) &&
            (i != 1) &&
            !((i % 8 == 0 && i != 0) || i == 2))
        ? 4
        : 2);
  }

  int getWidth(int i) {
    return ((i % 8 == 0 && i != 0) || i == 2) ? 4 : 2;
  }
}
