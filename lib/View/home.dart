import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/note_controller.dart';
import 'archive.dart';
import 'create.dart';
import 'trash.dart';
import 'setting.dart';
import 'RegisterScreen.dart';

class home extends StatelessWidget {
  home({super.key});
  final controller = Get.find<NoteController>();

  void _showAddNoteDialog(BuildContext context) {
    TextEditingController noteText = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("إضافة ملاحظة".tr),
        content: TextField(
          controller: noteText,
          autofocus: true,
          decoration: InputDecoration(hintText: "اكتب ملاحظتك هنا".tr),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("إلغاء".tr),
          ),
          TextButton(
            onPressed: () {
              if (noteText.text.isNotEmpty) {
                controller.addNote(noteText.text);
              }
              Navigator.pop(context);
            },
            child: Text("إضافة".tr),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Note"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () => controller.toggleLanguage(),
            tooltip: 'change_language'.tr,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/1.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text("@Hagar",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('notes'.tr),
              onTap: () => Get.to(() => home()),
            ),
            ListTile(
              leading: Icon(Icons.archive),
              title: Text('archive'.tr),
              onTap: () => Get.to(() => archive()),
            ),
            ListTile(
              leading: Icon(Icons.library_add_check),
              title: Text('tasks'.tr),
              onTap: () => Get.to(() => Create()),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('trash'.tr),
              onTap: () => Get.to(() => trash()),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings'.tr),
              onTap: () => Get.to(() => setting()),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'.tr),
              onTap: () => Get.offAllNamed('/login'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                Text("${'font_size'.tr}: ${controller.fontSize.toInt()}"),
                Expanded(
                  child: GetBuilder<NoteController>(
                    builder: (controller) => Slider(
                      min: 8,
                      max: 32,
                      value: controller.fontSize,
                      onChanged: (value) => controller.changeFontSize(value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<NoteController>(
              builder: (controller) => ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                      controller.notes[index],
                      style: TextStyle(fontSize: controller.fontSize),
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.delete_forever, color: Colors.red),
                      onPressed: () => controller.deleteNote(index),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddNoteDialog(context),
      ),
    );
  }
}