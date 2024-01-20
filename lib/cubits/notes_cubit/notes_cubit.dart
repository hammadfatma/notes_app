import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(
        kNotesBox); //<this is type of data that stored in variable>
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
