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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(children: <Widget>[
        // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
        //                  Top Bar
        // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
        Container(
            color: Colors.black38,
            height: 60,
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image(
                      image: AssetImage('assets/images/logo-white.png'),
                      height: 25,
                    )),
              ],
            )),
        Expanded(
          child: Row(
            children: <Widget>[
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              //                Left Sidebar
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              Container(
                color: Colors.black12,
                width: 80,
              ),
              Expanded(
                child: Container(),
              ),
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              //                Right Sidebar
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              Container(
                color: Colors.black12,
                width: 300,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
