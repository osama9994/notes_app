import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubit/cubit/add_notes_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteLoading) {
              if (state is AddNoteFailure) {
                print("failed ");
              }
              if (state is AddNoteSuccess) {
                Navigator.pop(context);
              }
            }
          },
          builder: (context, state) {
            return
             AbsorbPointer(
              absorbing: state is AddNoteLoading?true:false,
               child:Padding(padding: 
               EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                
               ),
               child: const SingleChildScrollView(
                child: addNoteForm(),
               ),
               ),
             );
          },
        ),
      ),
    );
  }
}
