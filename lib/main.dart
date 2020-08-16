import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class SomeData {
  String name;
  Color iColor;

  SomeData({this.name, this.iColor});
}

enum Widgets {
  Text,
  Image,
  Align,
  // ...
  Center,
  ConstrainedBox,
  Container,
  Expanded,
  Padding,
  SizedBox,
  // ...
  Column,
  ListView,
  Row,
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
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: ChangeNotifierProvider(
              create: (context) => CurrentItem(),
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
                        builder: (context, List<String> candidateData,
                            rejectedData) {
                          return Container(
                            height: 812,
                            width: 375,
                            color: Colors.black12,
                            child: DrawwableWidgetSpace(
                              key: UniqueKey(),
                              dropText: dropText,
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
        Consumer<CurrentItem>(
          builder: (context, currentItem, child) {
            return Text(currentItem.getCurrentItem());
          },
        ),
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

class WidgetListItem extends ItemInWidgetList {
  WidgetListItem({String title, this.data, this.icon}) : super(title);

  final String data;
  final IconData icon;
}

// The entire multilevel list displayed by this app.
final List<Category> data = <Category>[
  Category(
    'Basic',
    <ItemInWidgetList>[
      WidgetListItem(
        title: 'Text',
        data: "Text Widget",
        icon: FontAwesomeIcons.paragraph,
      ),
      WidgetListItem(
        title: 'Image',
        data: "Image Widget",
        icon: FontAwesomeIcons.image,
      ),
    ],
  ),
  Category(
    'Layout',
    <ItemInWidgetList>[
      Category(
        "Single-child",
        <ItemInWidgetList>[
          WidgetListItem(
            icon: FontAwesomeIcons.alignCenter,
            data: "Align Widget",
            title: "Align",
          ),
          WidgetListItem(
            icon: FontAwesomeIcons.vectorSquare,
            data: "Center Widget",
            title: "Center",
          ),
          WidgetListItem(
            icon: FontAwesomeIcons.compressArrowsAlt,
            data: "ConstrainedBox Widget",
            title: "Constrained Box",
          ),
          WidgetListItem(
            icon: FontAwesomeIcons.square,
            data: "Container Widget",
            title: "Container",
          ),
          WidgetListItem(
            icon: FontAwesomeIcons.expandArrowsAlt,
            data: "Expanded Widget",
            title: "Expanded",
          ),
          WidgetListItem(
            icon: FontAwesomeIcons.compress,
            data: "Padding Widget",
            title: "Padding",
          ),
          WidgetListItem(
            icon: FontAwesomeIcons.expand,
            data: "SizedBox Widget",
            title: "Sized Box",
          ),
        ],
      ),
      Category("Multi-child", <ItemInWidgetList>[
        WidgetListItem(
          icon: FontAwesomeIcons.columns,
          data: "Column Widget",
          title: "Column",
        ),
        WidgetListItem(
          icon: FontAwesomeIcons.list,
          data: "ListView Widget",
          title: "List View",
        ),
        WidgetListItem(
          icon: FontAwesomeIcons.stream,
          data: "Row Widget",
          title: "Row",
        ),
      ]),
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
    // https://stackoverflow.com/questions/49557555/custom-style-or-theme-for-expansion-tile-header-flutter
    // When ExpansionTile is closed
    //    the style of header text i.e. title depends on ThemeData.textTheme.subhead
    //    whereas, the style of the arrow icon depends on ThemeData.unselectedWidgetColor
    // When ExpansionTile is open
    //    the color of both the widgets depends on ThemeData.accentColor
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Colors.white,
          ),
        ),
        accentColor: Colors.white70,
        unselectedWidgetColor: Colors.white,
        dividerColor: Colors.white10,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      child: ExpansionTile(
        key: PageStorageKey<Category>(root),
        title: Text(root.title),
        children: _buildChildren(root),
        initiallyExpanded: true,
      ),
    );
  }

  Widget _buildSubTiles(Category root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        accentColor: Colors.white70,
        unselectedWidgetColor: Colors.white,
        dividerColor: Colors.black12,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(left: 26, right: 16),
        key: PageStorageKey<Category>(root),
        title: Text(root.title),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 36),
            child: Column(
              children: _buildChildren(root),
            ),
          ),
        ],
        initiallyExpanded: true,
      ),
    );
  }

  List<Widget> _buildChildren(root) {
    List<Widget> children = [];
    root.children.forEach((child) {
      if (child.runtimeType == Category) {
        children.add(_buildSubTiles(child));
      } else {
        children.add(
          _buildDraggableWidget(
            title: child.title,
            icon: child.icon,
            data: child.data,
          ),
        );
      }
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
        padding: EdgeInsets.only(
          bottom: 12,
          left: 10,
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

class DrawwableWidgetSpace extends StatefulWidget {
  final String dropText;
  DrawwableWidgetSpace({Key key, this.dropText}) : super(key: key);
  @override
  _DrawwableWidgetSpaceState createState() =>
      _DrawwableWidgetSpaceState(dropText: this.dropText);
}

class _DrawwableWidgetSpaceState extends State<DrawwableWidgetSpace> {
  String dropText;
  Color color = Colors.red;
  String currentItem;

  _DrawwableWidgetSpaceState({this.dropText});
  @override
  Widget build(BuildContext context) {
    if (dropText == "Container Widget") {
      return new Consumer<CurrentItem>(builder: (context, currentItem, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: color,
          child: GestureDetector(onTap: () {
            setState(() {
              currentItem.setCurrentItem(dropText);
              color = Colors.yellow;
            });
          }),
        );
      });
    } else {
      return new Center(
        child: Text(dropText),
      );
    }
  }
}

class CurrentItem extends ChangeNotifier {
  String _currentItem = "";
  setCurrentItem(String currentItem) {
    this._currentItem = currentItem;
    notifyListeners();
  }

  String getCurrentItem() {
    return this._currentItem;
  }
}
