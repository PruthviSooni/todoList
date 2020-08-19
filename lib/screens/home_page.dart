import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:todo_app/configs/tasks_list.dart';
import 'package:todo_app/widgets/floating_widget.dart';
import 'package:todo_app/widgets/listVies_items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ContainerTransitionType _transitionType =
      ContainerTransitionType.fadeThrough;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
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
                ]),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        horizontalOffset: 300.0,
                        child: FadeInAnimation(
                          child: ListItems(
                            taskTitle: tasksList[index].taskTitle,
                            taskTime: tasksList[index].taskTime,
                            isChecked: tasksList[index].isDone,
                            toggleCheckBox: (state) {
                              setState(() {
                                tasksList[index].toggleDone();
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingWidget(transitionType: _transitionType),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
