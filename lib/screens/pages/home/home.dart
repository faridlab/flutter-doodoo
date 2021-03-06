import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:doodoo/store/tasks/tasks.dart';
import 'package:doodoo/utils/ScreenArguments.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [Provider<Tasks>(create: (_) => Tasks())],
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            TodoListView(),
          ],
        ),
        bottomNavigationBar: InputTaskText(),
      ));
}

class Header extends StatelessWidget {
  final Color color1 = Color(0xffFA696C);
  final Color color2 = Color(0xffFA8165);
  final Color color3 = Color(0xffFB8964);

  final TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final tasks = Provider.of<Tasks>(context);
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

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final tasks = Provider.of<Tasks>(context);
      if (tasks.countTasks == 0) {
        return Row(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('You have no task', style: TextStyle(fontSize: 18.0)),
          )
        ]);
      }

      return Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: ListView.builder(
            itemCount: tasks.visibleTodos.length,
            itemBuilder: (_, index) {
              final todo = tasks.visibleTodos[index];
              return Observer(builder: (context) {
                return ListTile(
                  title: Row(
                    children: <Widget>[
                      Checkbox(
                          value: todo.done,
                          onChanged: (flag) => todo.done = flag),
                      Expanded(
                          child: InkWell(
                        child: Text(
                          todo.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/task/detail',
                            arguments: ScreenArguments(id: todo.id),
                          );
                        },
                      )),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => tasks.removeTodo(todo),
                      )
                    ],
                  ),
                );
              });
            }),
      );
    });
  }
}

class InputTaskText extends StatelessWidget {
  final TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context);
    textController.text = '';
    // return Observer(builder: (context) {
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
    // });
  }
}
