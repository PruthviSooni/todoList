import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasksList = [];
  TimeOfDay timeOfDay;

  int get tasksLength => _tasksList.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasksList);

  void addTask(String taskTitle, String taskTime, bool isDone) {
    final task = Task(taskTitle: taskTitle, taskTime: taskTime, isDone: isDone);
    _tasksList.add(task);
    notifyListeners();
  }

  void updateToggle(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
