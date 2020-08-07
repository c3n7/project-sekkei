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
                  child: _CollapsibleWidgetItemList(),
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

class _CollapsibleWidgetItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (
        BuildContext context,
        int index,
      ) =>
          _CollapsibleWidgetItem(data[index]),
      itemCount: data.length,
    );
  }
}

// One entry in the multilevel list displayed by this app.
class ItemInWidgetList {
  final String title;
  ItemInWidgetList(this.title);
}

class Category extends ItemInWidgetList {
  Category(String title, [this.children = const <Category>[]]) : super(title);

  final List<ItemInWidgetList> children;
}

class WidgetItem extends ItemInWidgetList {
  WidgetItem({String title, this.data, this.icon}) : super(title);

  final String data;
  final IconData icon;
}

// The entire multilevel list displayed by this app.
final List<Category> data = <Category>[
  Category(
    'Basic',
    <ItemInWidgetList>[
      WidgetItem(
        title: 'Text',
        data: "Text Widget",
        icon: FontAwesomeIcons.paragraph,
      ),
      WidgetItem(
        title: 'Image',
        data: "Image Widget",
        icon: FontAwesomeIcons.image,
      ),
    ],
  ),
  Category(
    'Layout',
    <ItemInWidgetList>[
      WidgetItem(
        icon: FontAwesomeIcons.alignCenter,
        data: "Align Widget",
        title: "Align",
      ),
      WidgetItem(
        icon: FontAwesomeIcons.vectorSquare,
        data: "Center Widget",
        title: "Center",
      ),
      WidgetItem(
        icon: FontAwesomeIcons.compressArrowsAlt,
        data: "ConstrainedBox Widget",
        title: "Constrained Box",
      ),
      WidgetItem(
        icon: FontAwesomeIcons.square,
        data: "Container Widget",
        title: "Container",
      ),
      WidgetItem(
        icon: FontAwesomeIcons.expandArrowsAlt,
        data: "Expanded Widget",
        title: "Expanded",
      ),
      WidgetItem(
        icon: FontAwesomeIcons.compress,
        data: "Padding Widget",
        title: "Padding",
      ),
      WidgetItem(
        icon: FontAwesomeIcons.expand,
        data: "SizedBox Widget",
        title: "Sized Box",
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class _CollapsibleWidgetItem extends StatelessWidget {
  const _CollapsibleWidgetItem(this.entry);

  final Category entry;

  Widget _buildTiles(Category root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Category>(root),
      title: Text(root.title),
      children: _buildChildren(root),
      initiallyExpanded: true,
    );
  }

  List<Widget> _buildChildren(root) {
    List<Widget> children = [];
    root.children.forEach((child) {
      children.add(
        _buildDraggableWidget(
          title: child.title,
          icon: child.icon,
          data: child.data,
        ),
      );
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
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
