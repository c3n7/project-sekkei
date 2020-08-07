# Project Sekkei
![build](https://github.com/c3n7/project-sekkei/workflows/build/badge.svg) [![codecov](https://codecov.io/gh/c3n7/project-sekkei/branch/master/graph/badge.svg)](https://codecov.io/gh/c3n7/project-sekkei)
  
A flutter UI design tool.
I aim to build to UI designer that will output the corresponding dart/flutter code. I aim to make it able to generate widget-tests as required, and to also allow preview of the code generated.

### Continuous Releases
These are pre-release builds that are updated each time I push a build. Before downloading, check whether the build is passing via the badge above.
- [Windows installer.](https://github.com/c3n7/project-sekkei/releases/download/continuous/project_sekkei.1.0.0.msi)
- Linux:
  - [Linux AppImage.](https://github.com/c3n7/project-sekkei/releases/download/continuous/project_sekkei-1.0.0-x86_64.AppImage)
  - If you don't know how to work with AppImages, [here is a simple guide](https://codeburst.io/how-to-install-and-run-appimage-on-linux-systems-f031ec6a85ce#a9f9).  
      The guide can be summarized as:
      1. Allow execution of the file. This only needs to be done once:
          ```shell
          $ chmod u+x project_sekkei-1.0.0-x86_64.AppImage
          ```
      2. To run it, double click on the file or, in your terminal:
          ```shell
          $ ./project_sekkei-1.0.0-x86_64.AppImage
          ```

### TODOs
#### Widget structure
- Basic widgets
  - Appbar
  - Column
  - Container
  - FlutterLogo
  - Icon
  - Image
  - Placeholder
  - RaisedButton
  - Row
  - Scaffold
  - Text
- Layout widgets
  - Single-child layout widgets
      - Align
      - AspectRatio
      - Baseline
      - Center
      - ConstrainedBox
      - Container
      - CustomSingleChildLayout
      - Expanded
      - FittedBox
      - FractionallySizedBox
      - IntrinsicHeight
      - IntrinsicWidth
      - LimitedBox
      - Offstage
      - OverflowBox
      - Padding
      - SizedBox
      - SizedOverflowBox
      - Transform
  - Multi-child layout widgets
      - Column
      - CustomMultiChildLayout
      - Flow
      - GridView
      - IndexedStack
      - LayoutBuilder
      - ListBody
      - ListView
      - Row
      - Stack
      - Table
      - Wrap
- Material Components
  - App structure and navigation
      - Appbar
      - BottomNavigationBar
      - Drawer
      - MaterialApp
      - Scaffold
      - SilverAppBar
      - TabBar
      - TabBarView
      - WidgetsApp
  - Buttons
      - ButtonBar
      - DropdownButton
      - FlatButton
      - FloatingActionButton
      - IconButton
      - OutlineButton
      - PopupMenuButton
      - RaisedButton
  - Input and Selections
      - Checkbox
      - Date & Time Pickers
      - Radio
      - Slider
      - Switch
      - TextField
  - Dialogs, alerts, and panels
      - AlertDialog
      - BottomSheet
      - ExpansionPanel
      - SimpleDialog
      - SnackBar
  - Information displays
      - Card
      - Chip
      - CircularProgressIndicator
      - DataTable
      - GridView
      - Icon
      - Image
      - LinearProgressIndicator
      - Tooltip
  - Layout
      - Divider
      - ListTile
      - Stepper
