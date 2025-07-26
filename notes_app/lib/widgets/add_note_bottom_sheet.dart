import 'package:flutter/material.dart';

import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/cutom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CutomTextField(hint: "Title",),
            SizedBox(height:16 ),
             CutomTextField(hint: "Content",maxLines: 5,),
             SizedBox(height: 45),
             CustomButton(),
             SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

