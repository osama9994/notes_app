import 'package:flutter/material.dart';
import 'package:notes_app/view/notes_view.dart';

void main() {
  runApp(const Notesapp());
}

class Notesapp extends StatelessWidget {
  const Notesapp({super.key});

 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  theme: ThemeData(brightness: Brightness.dark,
  fontFamily: 'Poppins'),
  home: const NotesView(),
    );
  }
}

