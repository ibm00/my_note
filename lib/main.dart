import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/notes_provider.dart';

import './screens/note_screen.dart';
import './screens/home_screen.dart';
import './theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Note App',
        theme: myTheme(),
        routes: {
          '/': (_) => HomeScreen(),
          NoteScreen.routeName: (_) => NoteScreen(),
        },
      ),
    );
  }
}
