import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../providers/notes_provider.dart';
import 'package:provider/provider.dart';

import '../screens/note_screen.dart';

class NoteItem extends StatelessWidget {
  final int id;
  final String title;
  final String date;
  final int index;
  final int hight;
  final int width;
  NoteItem({
    @required this.width,
    @required this.hight,
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.index,
  });

  final List<Color> _colors = [
    Color(0xFFFFAB91),
    Color(0xFFFFCC80),
    Color(0xFFE6EE9B),
    Color(0xFF80DEEA),
    Color(0xFFCF93D9),
    Color(0xFFF48FB1),
    Color(0xFF80CBC4),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(NoteScreen.routeName, arguments: id);
      },
      child: Dismissible(
        background: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FaIcon(
              FontAwesomeIcons.trash,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        key: ValueKey(id),
        onDismissed: (d) async {
          await Provider.of<NoteProvider>(context, listen: false)
              .deleteNote(id);
        },
        direction: DismissDirection.endToStart,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: _colors[index % 7],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: (hight == 2) ? 4 : 12,
                ),
                Column(
                  crossAxisAlignment: (width == 2)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Color(0xCC616161),
                        fontSize: 19,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
