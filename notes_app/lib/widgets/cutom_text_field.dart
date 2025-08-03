import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CutomTextField extends StatelessWidget {
  const CutomTextField({super.key, required this.hint,  this.maxLines=1, this.onSaved, this.onChanged});
final String hint;
final int maxLines;
final Function(String)? onChanged;
final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty??true){
          return "field is required";
        }else{return null;}
      },
      cursorColor:kPrimaryColor ,
      maxLines: maxLines,
      decoration:InputDecoration(
        hintText: hint,hintStyle: TextStyle(color: kPrimaryColor),
        border: buildborder(),
        enabledBorder: buildborder(),
        focusedBorder: buildborder(color: kPrimaryColor)
      ),
    );
  }

  OutlineInputBorder buildborder({color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:  BorderSide(
          color:color?? Colors.white,
        )
      );
  }
}