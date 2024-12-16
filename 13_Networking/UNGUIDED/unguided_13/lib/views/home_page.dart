import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notes_controller.dart';

class HomePage extends StatelessWidget {
  final NotesController _notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: _notesController.notes.length,
            itemBuilder: (context, index) {
              final note = _notesController.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _notesController.deleteNote(index),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add_note'),
        child: Icon(Icons.add),
      ),
    );
  }
}
