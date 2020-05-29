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
                color: Colors.white,
                fontSize: 45,
                fontFamily: 'Source Sans Pro',
              ),
            ),
            backgroundColor: Colors.red[800],
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Container(
                    child: Icon(
                      Icons.alarm_on,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Icon(
                      Icons.format_quote,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Icon(
                      Icons.list,
                      size: 45,
                      color: Colors.white,
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
