import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notes_controller.dart';
import '../models/note.dart';

class AddNotePage extends StatelessWidget {
  final NotesController _notesController = Get.find();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Note Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Note Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  _notesController.addNote(
                    Note(
                      title: _titleController.text,
                      description: _descriptionController.text,
                    ),
                  );
                  Get.back(); // Return to home page
                } else {
                  Get.snackbar(
                    'Error',
                    'Please enter both title and description',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
