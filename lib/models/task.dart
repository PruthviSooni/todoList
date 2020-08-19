class Task {
  final String taskTitle;
  final String taskTime;
  bool isDone;

  Task({this.taskTitle, this.taskTime, this.isDone = false});
  void toggleDone() {
    isDone = !isDone;
  }
}
