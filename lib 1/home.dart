import 'package:flutter/material.dart';
import 'archive.dart';
import 'create.dart';
import 'RegisterScreen.dart';
import 'trash.dart';
import 'setting.dart';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> notes = [ 'ملاحظة1 ',
    'ملاحظة2 ',
    'ملاحظة 3',
    'ملاحظة 4',
    'ملاحظة 5',
    'ملاحظة 6',
    'ملاحظة 7',
    'ملاحظة 8',
    'ملاحظة 9',
    'ملاحظة 10',
  ];


  Widget buildListTile(context, txt, icon, page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(txt),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }


  void _showAddNoteDialog(BuildContext context) {
    TextEditingController note = TextEditingController();
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text("إضافة ملاحظة"),
            content: TextField(
              controller: note,
              autofocus: true,
              //decoration: InputDecoration(hintText: "اكتب ملاحظتك هنا"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("إلغاء"),
              ),
              TextButton(
                onPressed: () {
                  if (note.text.isNotEmpty) {
                    setState(() {
                      notes.add(note.text);
                    });
                  }
                  Navigator.pop(context);
                },
                child: Text("إضافة"),
              ),
            ],
          ),
    );
  }
double fontSize=22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google note"),
        backgroundColor: Colors.blue,
        centerTitle: true,
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
                    backgroundImage: AssetImage('images/1.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text("@ Hagar",textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 18,)),
                ],
              ),
            ),
            //buildListTile(context, "الملاحظات", Icons.note),
            buildListTile(context, "الأرشيف", Icons.archive, archive()),

            buildListTile(context, "المهام", Icons.library_add_check, Create()),
            buildListTile(context, "المحذوفات", Icons.delete, trash()),
            buildListTile(context, "الإعدادات", Icons.settings, setting()),
            buildListTile(
                context, "تسجيل الخروج", Icons.logout, RegisterScreen()),
          ],
        ),
      ),
      body:
      Column(
        children: [
          Padding(padding: const
          EdgeInsets.all(9.0),
            child: Row(
              children: [
                Text("حجم الخط: ${fontSize. toInt()}"),
                Expanded(child: Slider(
                  min: 8,
                    max: 32,
                    value: fontSize, onChanged: (value){
                    setState(() {
                      fontSize=value;
                    });
                  },
                ),
                ),
              ],
            ),
          ),
        Expanded(
          child:
           ListView.builder(

        itemCount: notes.length,
        itemBuilder: (context, index) =>
            Card(
              child: ListTile(
                title: Text(notes[index],style: TextStyle(fontSize: fontSize),),
                leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            content: Text("هل تريد حذف الملاحظه "),
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
                ),
              ),

              ),
             ),
        ],
      ),


/*bottomNavigationBar: BottomNavigationBar(
    items: [
BottomNavigationBarItem(
icon: Icon(Icons.note_add), label: 'اضافة ملاحظة',),
    BottomNavigationBarItem(
    icon: Icon(Icons.archive), label: 'أرشيف'),
    BottomNavigationBarItem(
    icon: Icon(Icons.settings), label: 'إعدادات'),
    ],
),*/

        floatingActionButton: FloatingActionButton(
child: Icon(Icons.add),
onPressed: () {
  _showAddNoteDialog(context);
},
  )
    );
  }





// ListView.builder(
// itemCount: notes.length,
//itemBuilder: (context, index) => Card(
// margin: EdgeInsets.all(8),
//child: ListTile(
//title: Text(notes[index]),
//trailing: IconButton(
//icon: Icon(Icons.delete, color: Colors.red),
//onPressed: () {

//setState(() {
//notes.removeAt(index);
//});
//},
//),
//),
//),
//),
//floatingActionButton: FloatingActionButton(
//child: Icon(Icons.add),
//onPressed: () {
//_showAddNoteDialog(context);

}