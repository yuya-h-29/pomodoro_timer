import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
//import 'dart:math';

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
  int timeLeftInSec = 10;
  Timer timer;
  int min;
  int sec;
  String minStr = '25';
  String secStr = '00';
  bool isRunning = false;

  void startOrStop() {
    if (timeLeftInSec == 0){
      timeLeftInSec = 10;
    }

    // need to find how to stop the timer...
    if(isRunning){
      timer.cancel();
      isRunning = false;
    } else {
      isRunning = true;
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeftInSec > 0) {
          timeLeftInSec--;
          min = (timeLeftInSec / 60).truncate();
          minStr = (min % 60).toString().padLeft(2, '0');
          sec = timeLeftInSec - min * 60;
          secStr = sec.toString().padLeft(2, '0');
        } else {
          final player = AudioCache();
          player.play('bikehorn.wav');
          timer.cancel();
        }
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
            '$minStr : $secStr',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              fontFamily: 'Chelsea',
            ),
          ),
          (timeLeftInSec == 10)
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
