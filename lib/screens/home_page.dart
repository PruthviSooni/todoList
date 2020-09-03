import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/app_banner.dart';
import 'package:todo_app/widgets/floating_widget.dart';
import 'package:todo_app/widgets/tasks_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBanner(),
          TasksList(),
        ],
      ),
      floatingActionButton: FloatingWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
