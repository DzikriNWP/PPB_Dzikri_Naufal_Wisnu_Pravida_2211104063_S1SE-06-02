import 'package:get/get.dart';
import '../models/note.dart';

class NotesController extends GetxController {
  RxList<Note> notes = <Note>[].obs;

  void addNote(Note note) {
    notes.add(note);
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }
}
