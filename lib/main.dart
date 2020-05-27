import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

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
              color: Colors.red[300],
              fontSize: 45,
              fontFamily: 'Source Sans Pro',
            ),
          ),
          backgroundColor: Colors.orange[100],
        ),
        body: countDownTimer(),
      ),
    ),
  );
}

class countDownTimer extends StatefulWidget {
  @override
  _countDownTimerState createState() => _countDownTimerState();
}

class _countDownTimerState extends State<countDownTimer> {
  int timeLeftInSec = 100;
  var timeLeft;
  Timer timer;
  int min;

//  bool hasStarted = false;

//  void startOrStop(){
//    if (!hasStarted) {
//      startTimer();
//      hasStarted = true;
//    }
//  }

//  var format = new DateFormat("mm:ss");

  void startOrStop() {
    if (timeLeftInSec == 0){
      timeLeftInSec = 100;
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeftInSec > 0) {
          timeLeftInSec--;
//          timeLeft= Duration(minutes: timeLeftInSec.inMinutes )
        } else {
          timer.cancel();
        }
//          hasStarted = true;
//         else {
//          timer.cancel();
////          hasStarted = false;
//          if (timeLeft > 0){
//            posedTime = timeLeft;
//            print(posedTime);
//          }
//        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '$timeLeft',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              fontFamily: 'Chelsea',
            ),
          ),
          (timeLeftInSec == 100)
              ? Text(
                  'Tap Pomotaro\nand\nstart timer!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Chelsea',
                      fontSize: 50,
                      color: Colors.pink[800]),
                )
              : (timeLeftInSec > 0)
                  ? Text(
                      'You can do it!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Chelsea',
                          fontSize: 50,
                          color: Colors.pink[800]),
                    )
                  : Text(
                      'Otsukaresama!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Chelsea',
                          fontSize: 50,
                          color: Colors.pink[800]),
                    ),
          FlatButton(
            onPressed: () {
              startOrStop();
            },
            child: Image.asset('images/tomato.png'),
          ),
        ],
      ),
    );
  }
}
