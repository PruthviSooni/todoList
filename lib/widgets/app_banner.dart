import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks_provider.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.list,
              size: 30.0,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).accentColor,
            radius: 30.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'To-Do List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "${Provider.of<TaskData>(context).tasksLength} Task's",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
