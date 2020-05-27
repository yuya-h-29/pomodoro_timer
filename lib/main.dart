import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text(
            'Pomodoro Timer',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red[200],
              fontSize: 45,
              fontFamily: 'Source Sans Pro',
            ),
          ),
          backgroundColor: Colors.orange[100],
        ),
        body: Timer(),
      ),
    ),
  );
}

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  int counter = 10;

  void startTimer() {
    setState(() {
      counter--;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'You can do it!!',
            style: TextStyle(
              fontFamily: 'Chelsea',
              fontSize: 50,
              color: Colors.pink[800],
            ),
          ),
          Text(
            '$counter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
          FlatButton(
            onPressed: () {
              startTimer();
            },
            child: Image.asset('images/tomato.png'),
          ),
        ],
      ),
    );
  }
}
