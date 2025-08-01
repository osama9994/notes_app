import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';

import 'package:notes_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());


  fetchAllNotes() {
     emit(NotesCubitLoading());
 try{ 
emit(NotesCubitLoading());
var notesBox =Hive.box<NoteModel>(kNoteBox);
List<NoteModel>notes=notesBox.values.toList();
(NotesCubitSuccess(notes));
 }catch(e){emit(NotesCubitFailure(e.toString()));}
  }
}
