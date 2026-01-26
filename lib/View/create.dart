import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/note_controller.dart';

class Create extends StatelessWidget {
  Create({super.key});
  final controller = Get.find<NoteController>();
  final TextEditingController taskController = TextEditingController();

  void addTask() {
    if(taskController.text.isNotEmpty) {
      controller.addNote(taskController.text);
      taskController.clear();
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tasks'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'add_task'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: addTask,
              child: Text('add'.tr),
            ),
          ],
        ),
      ),
    );
  }
}