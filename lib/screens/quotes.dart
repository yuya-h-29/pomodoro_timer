import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class quotes extends StatefulWidget {
  @override
  _quotesState createState() => _quotesState();
}

class _quotesState extends State<quotes> {
  String text;
  String author;

  @override
  void initState() {
    // TODO: implement initState
//    print('can you see me?');
    super.initState();
  }

  void getData() async {
    http.Response response = await http.get('https://type.fit/api/quotes');

    if (response.statusCode == 200) {
      String data = response.body;

      int index = Random().nextInt(100);
      print(index);

      text = jsonDecode(data)[index]['text'];
      author = jsonDecode(data)[index]['author'];
      print(text);
      print(author);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Center(
                child: (text != null)
                    ? Text(
                        '$text',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Chelsea',
                            fontSize: 40,
                            color: Colors.pink[800]),
                      )
                    : Text(
                        'Tap Pomotaro\nand\nget quote!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Chelsea',
                            fontSize: 50,
                            color: Colors.pink[800]),
                      ),
              ),
            ),
            Expanded(
              child: Center(
                child: (author != null)
                    ? Text(
                        '$author',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: 'Chelsea',
                            fontSize: 30,
                            color: Colors.pink[700]),
                      )
                    : Text(
                        'Humm...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Chelsea',
                            fontSize: 30,
                            color: Colors.pink[700]),
                      ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    getData();
                  });
                },
                child: Image.asset('images/tomato.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
