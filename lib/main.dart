import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/screens/countDownTimer.dart';
import 'package:pomodoro/screens/quotes.dart';
import 'package:pomodoro/screens/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 45,
                fontFamily: 'Source Sans Pro',
              ),
            ),
            backgroundColor: Colors.orange[100],
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Container(
                    child: Icon(
                      Icons.alarm_on,
                      size: 45,
                      color: Colors.red[300],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Icon(
                      Icons.format_quote,
                      size: 45,
                      color: Colors.red[300],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Icon(
                      Icons.list,
                      size: 45,
                      color: Colors.red[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              countDownTimer(),
              quotes(),
              todo(),
            ],
          ),
        ),
      ),
    );
  }
}
