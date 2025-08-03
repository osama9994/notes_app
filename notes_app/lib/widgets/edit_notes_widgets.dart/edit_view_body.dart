import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/cubit/notes_cubit/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/cutom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
 String? title,content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child:  Column(
        children: [
       const   SizedBox(height: 50),
          CustomAppBar(
            onPressed:(){
              widget.note.title=title?? widget.note.title;
              widget.note.subTitle=content?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
             
              },
            title: "Edit Note",icon: Icons.check),
         const SizedBox(height: 50),
          CutomTextField(hint: widget.note.title,onChanged:(value){title=value;} ,),
        
        const  SizedBox(height: 16),
         CutomTextField(hint: widget.note.subTitle,maxLines: 5,
        onChanged:(value){ content=value;} ,
        ),
        ],
      ),
    );
  }
}