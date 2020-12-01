import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final Color color1 = Color(0xffFA696C);
  final Color color2 = Color(0xffFA8165);
  final Color color3 = Color(0xffFB8964);
  final List tasks = [
    {"title": "Learn Flutter", "completed": true},
    {"title": "Detail task page", "completed": false},
    {"title": "Routes Navigation", "completed": false},
    {"title": "Store management", "completed": false},
    {"title": "Localstorage ex: SQLite, memory, etc", "completed": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            SizedBox(height: 40.0),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 20.0),
              child: OverflowBox(
                maxWidth: 500,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Today",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 100),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Tomorrow",
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ...tasks.map((task) => Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                    title: Text(
                  task["title"],
                  style: TextStyle(
                      decoration: task["completed"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.red,
                      fontSize: 22.0,
                      color: Colors.black),
                )))),
          ],
        ),
      ),
      bottomNavigationBar: InputTaskText(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: color2,
      //   child: Icon(Icons.add),
      //   onPressed: () {},
      // ),
    );
  }

  Container _buildHeader() {
    return Container(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: -100,
            top: -150,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [color1, color2]),
                  boxShadow: [
                    BoxShadow(
                        color: color2,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 10.0)
                  ]),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [color3, color2]),
                boxShadow: [
                  BoxShadow(
                      color: color3, offset: Offset(1.0, 1.0), blurRadius: 4.0)
                ]),
          ),
          Positioned(
            top: 100,
            right: 200,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [color3, color2]),
                  boxShadow: [
                    BoxShadow(
                        color: color3,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0)
                  ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Doodoo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.0),
                Text(
                  "You have 4 remaining\ntasks for today!",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputTaskText extends StatefulWidget {

  InputTaskText({Key key}) : super(key: key);

  @override
  InputTaskState createState() => new InputTaskState();
}

class InputTaskState extends State<InputTaskText> {
  final TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    textController.text = '';
    return BottomAppBar(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: TextFormField(
          controller: textController,
          onFieldSubmitted: (field) {
            print(field);
            textController.clear();
          },
          cursorColor: Theme.of(context).cursorColor,
          decoration: InputDecoration(
            hintText: 'Add task...',
            labelStyle: TextStyle(
              color: Color(0xFF6200EE),
            ),
            suffixIcon: Icon(
              Icons.add,
            ),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Color(0xFF6200EE)),
            // ),
          ),
        ),
      ),
    );
  }
  
}
