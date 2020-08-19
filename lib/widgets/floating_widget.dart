import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_tasks.dart';

class FloatingWidget extends StatelessWidget {
  const FloatingWidget({
    Key key,
    @required ContainerTransitionType transitionType,
  })  : _transitionType = transitionType,
        super(key: key);

  final ContainerTransitionType _transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: _transitionType,
      transitionDuration: Duration(milliseconds: 500),
      openBuilder: (context, _) => AddTasks(),
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, _) => Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle,
        ),
        child: Hero(
          tag: 'close',
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
