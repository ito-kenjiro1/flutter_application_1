import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> taskList = [];
  TextEditingController nameController = TextEditingController();

  void _addNewTask() {
    setState(() {
      taskList.add(nameController.text);
    });
    nameController.text = '';
  }

  void _completeTask(i) {
    setState(() {
      taskList.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "New Task")),
          Expanded(
              child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (BuildContext context, int taskCount) {
                    return ElevatedButton(
                      child: Text(taskList[taskCount]),
                      onPressed: () {
                        _completeTask(taskCount);
                      },
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
