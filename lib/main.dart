import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks_provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Color(0xff5b78fe),
          fontFamily: "Ubuntu",
          primarySwatch: Colors.blue,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff5b78fe),
            elevation: 5,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
