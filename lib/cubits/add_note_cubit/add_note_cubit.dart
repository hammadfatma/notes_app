import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
part 'add_note_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color? color;
  addNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(
          kNotesBox); //<this is type of data that stored in variable>
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
