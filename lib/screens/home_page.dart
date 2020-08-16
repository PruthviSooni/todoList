import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:todo_app/configs/tasks_list.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/screens/add_tasks.dart';

class HomePage extends StatelessWidget {
  final Tasks tasks;

  const HomePage({Key key, this.tasks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "To-Do App",
        ),
      ),
      body: Container(
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  horizontalOffset: 100.0,
                  child: FadeInAnimation(
                    child: ListItems(
                      tasks: tasksList[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageRouteTransition(
              animationType: AnimationType.slide_up,
              fullscreenDialog: true,
              builder: (context) => AddTasks()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

const margin_padding = EdgeInsets.all(3);

class ListItems extends StatelessWidget {
  final Tasks tasks;

  const ListItems({Key key, this.tasks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin_padding,
      elevation: 1,
      child: InkWell(
        onTap: null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cardWidget(),
          ),
        ),
      ),
    );
  }

  List<Widget> cardWidget() {
    return [
      Container(
        margin: EdgeInsets.only(left: 20, top: 10),
        child: Text(
          tasks.taskTitle,
          style: TextStyle(fontSize: 18),
        ),
      ),
      SizedBox(height: 5),
      Container(
        margin: EdgeInsets.only(left: 20, top: 10),
        child: Text(
          tasks.taskDetails,
          style: TextStyle(fontSize: 14),
        ),
      ),
      SizedBox(height: 5),
      Container(
        margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: Text(
          tasks.taskDeadLine,
          style: TextStyle(fontSize: 12),
        ),
      ),
    ];
  }
}
