import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      home: Container(
    child: Home(),
  )));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _like = 0;
  int _dislike = 0;
  String _infoText = "COMEÇAR!";

  void _likePeople(int numero) {
    setState(() {
      _like += numero;
      if (_like > _dislike) {
        _infoText = "FLUTTER É BÃO!!";
      } else if (_like == _dislike) {
        _infoText = "EMPATOU!";
      }
    });
  }

  void _dislikePeople(int numero) {
    setState(() {
      _dislike += numero;
      if (_dislike > _like) {
        _infoText = "VISH!!!";
      } else if (_dislike == _like) {
        _infoText = "EMPATOU!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/belo.png",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              child: Text("Flutter é bom? ",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.none,
                      fontSize: 30)),
            ),
            Align(
              child: Text("Sim: $_like",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.none,
                      fontSize: 30)),
            ),
            Align(
              child: Text("Não: $_dislike",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.none,
                      fontSize: 30)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: FlatButton(
                      color: Colors.brown[900],
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        _likePeople(1);
                      },
                      child: Text("😍",
                          style: TextStyle(color: Colors.white, fontSize: 30))),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: FlatButton(
                      color: Colors.brown[900],
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        _dislikePeople(1);
                      },
                      child: Text("😡",
                          style: TextStyle(color: Colors.white, fontSize: 30))),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none,
                  fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}
