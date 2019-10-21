import 'package:flutter/material.dart';

class WidgetsSettings extends StatefulWidget {
  @override
  _WidgetsSettingsState createState() => _WidgetsSettingsState();
}

class _WidgetsSettingsState extends State<WidgetsSettings> {
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
              'Configurações do Widget',
              style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize),
            ),
          ),
        )
      ],
    );
  }
}