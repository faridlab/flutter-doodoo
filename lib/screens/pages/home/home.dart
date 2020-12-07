import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/store/tasks/tasks.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List tasks = [
    {"title": "Learn Flutter", "completed": true},
    {"title": "Detail task page", "completed": false},
    {"title": "Routes Navigation", "completed": false},
    {"title": "Store management", "completed": false},
    {"title": "Localstorage ex: SQLite, memory, etc", "completed": false},
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<Tasks>(create: (_) => Tasks())],
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header(),
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
        ));
  }
}

class Header extends StatelessWidget {
  final Color color1 = Color(0xffFA696C);
  final Color color2 = Color(0xffFA8165);
  final Color color3 = Color(0xffFB8964);

  final TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final tasks = context.watch<Tasks>();
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
                        color: color3,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0)
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
                    tasks.itemsDescription,
                    // "You have 4 remaining\ntasks for today!",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class InputTaskText extends StatelessWidget {
  final TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context);
    // print(tasks.itemsDescription);
    textController.text = '';
    return BottomAppBar(
      elevation: 0,
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: TextField(
          controller: textController,
          textInputAction: TextInputAction.done,
          onSubmitted: (value) {
            tasks.addTask(value);
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
