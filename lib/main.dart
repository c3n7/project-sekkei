import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: Column(children: <Widget>[
          Container(
            color: Colors.black38,
            height: 60,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.black12,
                  width: 80,
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  color: Colors.black12,
                  width: 300,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
