import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/configs/constants.dart';
import 'package:todo_app/models/tasks_provider.dart';

// ignore: must_be_immutable
class AddTasks extends StatefulWidget {
  @override
  _AddTasksState createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final TimeOfDay _time = TimeOfDay.now();
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TimeOfDay _picked;
  String newTask;
  final _controller = TextEditingController();

  Future<Null> selectTime(context) async {
    _picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    time = _picked.format(context).toString();
    setState(() {});
  }

  showSnackBar(String error) {
    var snackBar = SnackBar(
      content: Text("$error"),
    );
    _key.currentState.showSnackBar(snackBar);
  }

  var time;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      key: _key,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: Text(
              "we only plan for today. And must be completed today",
              style: TextStyle(
                  fontSize: 16, decorationStyle: TextDecorationStyle.wavy),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 3,
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade900,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Icon(
                        Icons.short_text,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: TextField(
                        controller: _controller,
                        onChanged: (newValue) => newTask = newValue,
                        decoration:
                            kInputDecoration.copyWith(hintText: "Title"),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.timer,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => selectTime(context),
                      child: Chip(
                        label: Text(time == null ? "Add Time To Task" : time),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  color: Colors.orangeAccent,
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      showSnackBar("Task Title should not be empty!");
                    } else if (time == null) {
                      showSnackBar("Pick Time");
                    } else {
                      provider.addTask(newTask.toString(), time, false);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
