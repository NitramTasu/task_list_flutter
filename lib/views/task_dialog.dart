import 'package:flutter/material.dart';
import 'package:my_app/models/task.dart';

class TaskDialog extends StatefulWidget {
  final Task task;

  //Construtor para editar uma task
  TaskDialog({this.task});

  @override
  State<StatefulWidget> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();

  //instância uma tarefa
  Task _currentTask = Task();

  @override
  void initState() {
    super.initState();

    //Quando é a edição de uma task
    if (widget.task != null) {
      _currentTask = Task.fromMap(widget.task.toMap());
    }

    _titleController.text = _currentTask.title;
    _descriptionController.text = _currentTask.description;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task == null ? 'Nova tarefa' : 'Editar tarefas'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Descrição'),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        FlatButton(
          child: Text('Salvar'),
          onPressed: () {
            _currentTask.title = _titleController.text;
            _currentTask.description = _titleController.text;
            _currentTask.isDone = false;
            
            Navigator.of(context).pop(_currentTask);
          },
        )
      ],
    );
  }

  // actionButton(String label, Function fn){
  //   return FlatButton( child: Text(label), onPressed: fn);
  // }
}
