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
  bool accepted = false;
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
                      axis: Axis.horizontal,
                      child: Container(
                        width: double.infinity,
                        color: Colors.red,
                        height: 65,
                      ),
                      feedback: Container(
                        width: double.infinity,
                        color: Colors.green,
                        height: 95,
                      ),
                      childWhenDragging: Container(
                        width: double.infinity,
                        color: Colors.blue,
                        height: 65,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: 65,
                      child: DragTarget(
                        builder: (context, List<String> candidateData,
                            rejectedData) {
                          return accepted
                              ? Container(height: 65, width: double.infinity)
                              : Container();
                        },
                        onWillAccept: (data) {
                          return true;
                        },
                        onAccept: (data) {
                          accepted = true;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
              //                Centre Canvas
              // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
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
