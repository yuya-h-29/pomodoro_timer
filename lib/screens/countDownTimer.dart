import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

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

//  bool isRunning = false;

  void startOrStop() {
    if (timeLeftInSec == 0) {
      timeLeftInSec = 10;
    }

    // need to find how to stop the timer...

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
//          timeLeftInSec = 10;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    '$minStr : $secStr',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      fontFamily: 'Chelsea',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: (timeLeftInSec == 10)
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
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    startOrStop();
                  },
                  child: Image.asset('images/tomato.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
