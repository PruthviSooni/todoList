import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks_provider.dart';

import 'listVies_items.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: AnimationLimiter(
          child: Consumer<TaskData>(
            builder: (context, taskData, child) {
              if (taskData.tasksLength == 0) {
                return Center(
                  child: Container(
                    child: Text(
                      "No Tasks Found !",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: taskData.tasksLength,
                  itemBuilder: (BuildContext context, int index) {
                    final task = taskData.tasks[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        horizontalOffset: 300.0,
                        child: FadeInAnimation(
                          child: ListItems(
                            taskTitle: task.taskTitle,
                            taskTime: task.taskTime,
                            isChecked: task.isDone,
                            toggleCheckBox: (checkState) {
                              taskData.updateToggle(task);
                            },
                            longPressed: () {
                              taskData.deleteTask(task);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
