import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CutomTextField extends StatelessWidget {
  const CutomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor:KPrimaryColor ,
      decoration:InputDecoration(
        hintText: "Title",hintStyle: TextStyle(color: KPrimaryColor),
        border: buildborder(),
        enabledBorder: buildborder(),
        focusedBorder: buildborder(color: KPrimaryColor)
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