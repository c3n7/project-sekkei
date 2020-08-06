import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class SomeData {
  String name;
  Color iColor;

  SomeData({this.name, this.iColor});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Sekkei',
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
  final bool accepted = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
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
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              //                Left Sidebar
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              Container(
                color: Colors.black12,
                width: 80,
                child: Column(
                  children: <Widget>[
                    MaterialButton(
                      height: 65,
                      child: Icon(
                        Icons.title,
                      ),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      height: 65,
                      child: Icon(
                        Icons.book,
                      ),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      height: 65,
                      child: Icon(
                        Icons.web_asset,
                      ),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      autofocus: true,
                      highlightColor: Color(0xFF525252),
                      height: 65,
                      child: Icon(
                        Icons.add_alert,
                      ),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      height: 65,
                      child: Icon(
                        Icons.dns,
                      ),
                      onPressed: () {},
                    ),
                    Draggable(
                      // axis: Axis.vertical,
                      data: "Doe",
                      child: Container(
                        // width: double.infinity,
                        width: 40,
                        color: Colors.red,
                        height: 65,
                      ),
                      feedback: Container(
                        width: 40,
                        // width: double.infinity,
                        color: Colors.green,
                        height: 60,
                      ),
                      childWhenDragging: Container(
                        width: 40,
                        // width: double.infinity,
                        color: Colors.blue,
                        height: 65,
                      ),
                    ),
                  ],
                ),
              ),
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              //                Centre Canvas
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return Container(
                          height: 80,
                          width: 80,
                          color: Colors.purple,
                          child: Center(
                            child: Text("Drop Here"),
                          ),
                        );
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        if (data == "Doe") {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Correct!'),
                            ),
                          );
                        }
                      },
                    ),
                    DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return Container(
                          height: 80,
                          width: 80,
                          color: Colors.purple,
                          child: Center(
                            child: Text("Not Here"),
                          ),
                        );
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        if (data == "Doe") {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Wrong!'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              //                Right Sidebar
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              Container(
                color: Colors.black12,
                width: 300,
                child: TextSettingsTab(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class TextSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Text("hello world"),
      ],
    );
  }
}
