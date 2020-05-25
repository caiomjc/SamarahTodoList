import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'task/task_empty.dart';
import 'task/task_form.dart';
import 'task/task_list.dart';
import '../helpers/task_model_json_converter.dart';
import '../models/task.dart';
import '../repository/repository.dart';

class Home extends StatefulWidget {
  final Repository repository;
  final TaskModelJsonConverter modelJsonConverter;

  Home({Key key, @required this.repository, @required this.modelJsonConverter})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> _tasksList = [];

  Task _lastTaskRemoved;
  int _lastTaskRemovedPosition;

  @override
  void initState() {
    super.initState();

    widget.repository.readData().then((data) {
      print("data: $data");

      if (data.isNotEmpty) {
        var tasksDecoded = widget.modelJsonConverter.toModel(data);

        setState(() {
          _tasksList = tasksDecoded;
        });
      }
    });
  }

  void _addTask(String description, DateTime date) {
    final newTask = Task(
      description: description,
      date: date,
    );

    setState(() {
      _tasksList.add(newTask);
    });

    var tasksEncoded = widget.modelJsonConverter.toJson(_tasksList);
    widget.repository.saveData(tasksEncoded);

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TaskForm(_addTask);
      },
    );
  }

  void _insertTask(int position, Task task) {
    setState(() {
      _tasksList.insert(position, task);
    });

    var tasksEncoded = widget.modelJsonConverter.toJson(_tasksList);
    widget.repository.saveData(tasksEncoded);
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _tasksList.sort((a, b) {
        if (a.finished && !b.finished)
          return 1;
        else if (!a.finished && b.finished)
          return -1;
        else
          return 0;
      });
    });

    var tasksEncoded = widget.modelJsonConverter.toJson(_tasksList);
    widget.repository.saveData(tasksEncoded);

    return null;
  }

  void onDismissed(BuildContext context, Task task, int index) {
    Scaffold.of(context).removeCurrentSnackBar();

    setState(() {
      _lastTaskRemoved = task;
      _lastTaskRemovedPosition = index;
      _tasksList.removeAt(index);
    });

    var tasksEncoded = widget.modelJsonConverter.toJson(_tasksList);
    widget.repository.saveData(tasksEncoded);

    final snackBar = SnackBar(
      content: Text("Tarefa \"${_lastTaskRemoved.description}\" removida."),
      action: SnackBarAction(
        label: "Desfazer",
        textColor: Theme.of(context).primaryColor,
        onPressed: () =>
            _insertTask(_lastTaskRemovedPosition, _lastTaskRemoved),
      ),
      duration: Duration(seconds: 4),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  void onChanged(Task task, bool check) {
    setState(() {
      task.finished = check;
    });

    var tasksEncoded = widget.modelJsonConverter.toJson(_tasksList);
    widget.repository.saveData(tasksEncoded);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Tarefas",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: _tasksList.isEmpty
                      ? TaskEmpty()
                      : TaskList(_tasksList, onChanged, onDismissed)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
