
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/cutom_text_field.dart';

class addNoteForm extends StatefulWidget {
  const addNoteForm({super.key});

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
  final GlobalKey<FormState>fromKey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return   Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(
            children: [
          const    SizedBox(height: 32),
              CutomTextField(hint: "Title",onSaved: (value){title=value;},),
              const SizedBox(height:16 ),
               CutomTextField(hint: "Content",maxLines: 5,onSaved: (value){subTitle=value;},),
              const SizedBox(height: 45),
               CustomButton(onTap: (){
                if(fromKey.currentState!.validate()){
                  fromKey.currentState!.save();
                }else{autovalidateMode=AutovalidateMode.always;
                    setState(() {
                  
                });}
               },),
              const  SizedBox(height: 30),
            ],
          ),
    );
  }}