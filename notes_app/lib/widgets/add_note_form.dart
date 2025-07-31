import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/cutom_text_field.dart';

class addNoteForm extends StatefulWidget {
  const addNoteForm({super.key});

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CutomTextField(
            hint: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CutomTextField(
            hint: "Content",
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 45),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: State is AddNoteLoading?true:false,
                onTap: () {
                  
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    var notemodel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateTime.now().toString(),
                      color: Colors.lightBlue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
