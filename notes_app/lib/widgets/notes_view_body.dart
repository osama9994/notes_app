import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: 
        [
          SizedBox(height: 50),
         const CustomAppBar(title: "Notes",icon: Icons.search,),
            
        Expanded(child: NotesListView()),
        
        ],
      ),
    );
  }
}

