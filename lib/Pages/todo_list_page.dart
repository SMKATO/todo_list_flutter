import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list_item.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController taskController = TextEditingController();

  List<Task> tasks = [];
  Task? deletedTask;
  int? deletedTaskPos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicione uma tarefa",
                          hintText: "Minha tarefa",
                        ),
                      ),
                    ),
                    SizedBox(width:  8),
                    ElevatedButton(
                        onPressed: () {
                          String text = taskController.text;
                          setState(() {
                            Task newTask = Task(
                              title: text,
                              dateTime: DateTime.now(),
                            );
                            tasks.add(newTask);
                          });
                          taskController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00d7f3),
                          padding: const EdgeInsets.all(14),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(Task task in tasks)
                        TaskListItem(
                          task: task,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text("Você possui ${tasks.length} tarefas pendentes",
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: showDeleteTaksConfirmationDialog,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00d7f3),
                          padding: const EdgeInsets.all(14),
                    ),
                          child: Text("Limpar tudo"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onDelete(Task task) {
    deletedTask = task;
    deletedTaskPos = tasks.indexOf(task);

    setState(() {
      tasks.remove(task);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Tarefa ${task.title} foi removida com sucesso!",
      style: TextStyle(color: Color(0xff060708)),),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: "Desfazer",
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              tasks.insert(deletedTaskPos!, deletedTask!);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
  void showDeleteTaksConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Limpar tudo?"),
        content: Text("você tem certeza que deseja apagar todas as tarefas?"),
        actions: [
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Color(0xff00d7f3)),
              child: Text("Cancelar")
          ),
           TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(primary: Colors.red),
          child: Text("Limpar tudo")
        ),
        ],
      ),
    );
  }
}


