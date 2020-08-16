import 'package:flutter/material.dart';
import 'package:todo_app/configs/constants.dart';

class AddTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        title: Text("Add the plan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Text(
                  "we only plna today. and must be completed today",
                  style: TextStyle(
                      fontSize: 16, decorationStyle: TextDecorationStyle.wavy),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height / 2.5,
              padding: EdgeInsets.all(14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 5,
                    color: Color(0xff6a7cd5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: kInputDecoration.copyWith(hintText: "Title"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: kInputDecoration.copyWith(hintText: "Details"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                      decoration:
                          kInputDecoration.copyWith(hintText: "DeadLine")),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    color: Colors.orangeAccent,
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
