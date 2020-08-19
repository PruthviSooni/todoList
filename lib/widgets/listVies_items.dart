import 'package:flutter/material.dart';
import 'package:todo_app/configs/constants.dart';

class ListItems extends StatelessWidget {
  final String taskTitle;
  final String taskTime;
  final bool isChecked;
  final Function toggleCheckBox;

  const ListItems(
      {this.taskTitle, this.taskTime, this.isChecked, this.toggleCheckBox});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: kRoundedBorders,
      color: Colors.grey.shade900,
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
      child: ListTile(
        shape: kRoundedBorders,
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          "$taskTime",
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Theme.of(context).accentColor,
          onChanged: toggleCheckBox,
        ),
      ),
    );
  }
}
