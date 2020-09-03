class Task {
  final String taskTitle;
  final String taskTime;
  bool isDone = false;

  Task({this.taskTitle, this.taskTime, this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
