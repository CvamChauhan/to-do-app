import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'new_task.dart';

class TaskData extends ChangeNotifier {
  List<NewTask> _tasks = [
    NewTask(note: 'buy milk'),
    NewTask(note: 'buy choco')
  ];
  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(newTask) {
    final task = NewTask(note: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(NewTask newTask) {
    newTask.toggleDone();
    notifyListeners();
  }

  void removeTask(NewTask newTask) {
    _tasks.remove(newTask);
    notifyListeners();
  }
}
