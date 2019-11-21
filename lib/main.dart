import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterweb/views/widget-settings.dart';
import 'package:flutterweb/views/widgets-list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String title = 'Flutter App Builder';

    window.onResize.listen((Event e) {
      setState(() {});
    });

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                height: 60,
                color: Color(0xff111111),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 15, right: 5), child: Icon(Icons.menu, color: Colors.white)),
                    Text(title, style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      width: 80,
                      color: Color(0xff333333),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Container(
                            width: 60,
                            height: 85,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 60,
                            height: 85,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 60,
                            height: 85,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                    this._appContent(title)
                  ]),
                  Expanded(
                    child: Row(children: <Widget>[
                      Container(
                        color: Colors.white,
                        width: 300,
                        child: WidgetsList(),
                      ),
                      Expanded(child: Container(color: Colors.black12, child: WidgetsSettings()))
                    ]),
                  )
                ],
              ))
            ],
          ),
        ));
  }

  Container _appContent(String title) {
    return Container(
      width: (window.innerWidth.toDouble() / 2) - 80,
      height: window.screen.available.height,
      color: Colors.black26,
      child: Center(
        child: Container(
          width: 300,
          height: 533,
          color: Colors.white,
          child: MyHomePage(title: title),
        ),
      ),
    );
  }

  void takeScreenShot() async {
    try {
      // RenderRepaintBoundary boundary = _MyHomePageState.previewContainer.currentContext.findRenderObject();
      // ui.Image image = await boundary.toImage();
      // final directory = (await getApplicationDocumentsDirectory()).path;
      // ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      // Uint8List pngBytes = byteData.buffer.asUint8List();

      // print(directory);
      // print(pngBytes);

      // File imgFile = File(pngBytes, "$directory/screenshot.png");

      // I.decodeImage(pngBytes);

      // File imgFile = new File("$directory/screenshot.png").writeAsBytes(pngBytes);
    } catch (e) {
      print(e);
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DragTarget(
        onAccept: (List<String> data) {
          print(['onAccept', data]);
        },
        onLeave: (List<String> data) {
          print(['onLeave', data]);
        },
        onWillAccept: (List<String> data) {
          print(['onWillAccept', data]);
          return true;
        },
        builder: (BuildContext context, list1, list2) {
          return _getScreenContent();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _getScreenContent() {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}
