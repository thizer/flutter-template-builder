import 'package:flutter/material.dart';

class WidgetsList extends StatefulWidget {
  @override
  _WidgetsListState createState() => _WidgetsListState();
}

class _WidgetsListState extends State<WidgetsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Container(
            child: Text(
              'Lista de Widgets',
              style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize),
            ),
          ),
        ),
      ],
    );
  }
}