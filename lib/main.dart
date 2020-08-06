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

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String dropText = "Drop Here";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
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
                  color: Colors.black26,
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
                    ],
                  ),
                ),
                Container(
                  color: Colors.black12,
                  width: 300,
                  child: Column(
                    children: <Widget>[
                      // Basic
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Basic"),
                      ),
                      Column(
                        children: <Widget>[
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.paragraph,
                            data: "Text Widget",
                            title: "Text",
                          ),
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.image,
                            data: "Image Widget",
                            title: "Image",
                          ),
                        ],
                      ),

                      // Layout widgets
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Layout"),
                      ),
                      Column(
                        children: <Widget>[
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.alignCenter,
                            data: "Align Widget",
                            title: "Align",
                          ),
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.vectorSquare,
                            data: "Center Widget",
                            title: "Center",
                          ),
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.compressArrowsAlt,
                            data: "ConstrainedBox Widget",
                            title: "Constrained Box",
                          ),
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.square,
                            data: "Container Widget",
                            title: "Container",
                          ),
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.expandArrowsAlt,
                            data: "Expanded Widget",
                            title: "Expanded",
                          ),
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.compress,
                            data: "Padding Widget",
                            title: "Padding",
                          ),
                          _buildDraggableWidget(
                            icon: FontAwesomeIcons.expand,
                            data: "SizedBox Widget",
                            title: "Sized Box",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
                //                Centre Canvas
                // -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
                Expanded(
                  child: Center(
                    child: DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return Container(
                          height: 812,
                          width: 375,
                          color: Colors.purple,
                          child: Center(
                            child: Text(dropText),
                          ),
                        );
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(
                          () {
                            dropText = data;
                          },
                        );
                      },
                    ),
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
        ],
      ),
    );
  }

  Widget _buildDraggableWidget({IconData icon, String title, String data}) {
    return Draggable(
      data: data,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 10,
        ),
        child: Row(
          children: <Widget>[
            FaIcon(
              icon,
              size: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(title),
            ),
          ],
        ),
      ),
      feedback: Container(
        color: Colors.black12,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 10,
          ),
          child: Row(
            children: <Widget>[
              FaIcon(
                icon,
                size: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Text(""),
      ],
    );
  }
}
