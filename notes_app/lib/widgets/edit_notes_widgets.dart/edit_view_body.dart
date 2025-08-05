import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/cubit/add_notes_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/cubit/notes_cubit/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors.dart/colors_list_view.dart';
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
        const SizedBox(height:16),
          EditNotesColorsList(note:widget.note  ), 
        ],
      ),
    );
  }
}

class EditNotesColorsList extends StatefulWidget {
 EditNotesColorsList({super.key, required this.note});
final NoteModel note;
  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {

int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: kColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return Padding(

          padding: const EdgeInsets.symmetric(horizontal:6 ),
          child:  GestureDetector(
            onTap: (){
              currentIndex=index;
              widget.note.color = kColor[index].value;
             
            },
            child: ColorItem(
              color: kColor[index],
           
              
              isActive: currentIndex==index)),
        );
      }),
    );
  }
}