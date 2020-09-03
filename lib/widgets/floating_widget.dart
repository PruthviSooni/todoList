import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks_provider.dart';
import 'package:todo_app/screens/add_tasks.dart';

class FloatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, _, child) => OpenContainer(
        closedColor: Theme.of(context).accentColor,
        openColor: Theme.of(context).accentColor,
        closedElevation: 10.0,
        openElevation: 15.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        transitionType: ContainerTransitionType.fade,
        openBuilder: (context, _) => AddTasks(),
        closedBuilder: (context, _) => CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          radius: 30,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
