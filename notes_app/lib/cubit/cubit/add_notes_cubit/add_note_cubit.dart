import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
addNote(NoteModel note)async{
  emit(AddNoteLoading());
 try{ 
emit(AddNoteLoading());
var notesBox =Hive.box<NoteModel>(kNoteBox);
await notesBox.add(note);
(AddNoteSuccess());
 }catch(e){emit(AddNoteFailure(e.toString()));}
}
}
 