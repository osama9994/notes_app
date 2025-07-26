import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/cutom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(title: "Edit Note",icon: Icons.check,),
        SizedBox(height: 50),
        CutomTextField(hint: "title"),
        
        SizedBox(height: 16),
        CutomTextField(hint: "Content",maxLines: 5,),
        ],
      ),
    );
  }
}