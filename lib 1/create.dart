import 'package:flutter/material.dart';
import 'show.dart';

class Create extends StatefulWidget {
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  List notes = ["  paython ",
      "flutter ",
    "C# ",
    "network power point ",];
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" قائمة المهام"),),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "اضف مهمة",
                icon: Icon(Icons.note),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(  style: ButtonStyle(
                  backgroundColor:
                  WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  setState(() {
                    if (name.text.isNotEmpty) {
                      notes.add(name.text);
                      name.clear();
                    }
                  });
                },
                child: Text("انشاء مهمة"),
              ),

              ElevatedButton(style: ButtonStyle(
                  backgroundColor:
                  WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Shownotes(notes: notes),
                    ),
                  );
                },
                child: Text("عرض المهام"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text("هل تريد حذف المهمه "),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  notes.removeAt(index);
                                });
                                Navigator.pop(context);
                              },
                              child: Text("نعم"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("لا"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.delete_forever,
                        color: Colors.red),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        notes[index] = name.text;
                      });
                    },
                    icon: Icon(Icons.edit,
                        color: Colors.blue),
                  ),
                  title: Text(
                    notes[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}