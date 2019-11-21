import 'package:flutter/material.dart';

class WidgetsList extends StatefulWidget {
  @override
  _WidgetsListState createState() => _WidgetsListState();
}

class _WidgetsListState extends State<WidgetsList> {
  Map<String, dynamic> mapWidgetsList = {
    "Basics": {
      "expanded": true,
      "items": ['AppBar', 'Column', 'Container', 'FlutterLogo', 'Icon', 'Image', 'Placeholder', 'RaisedButton', 'Row', 'Scaffold', 'Text']
    },
    "Layout": {
      "expanded": false,
      "items": ['Container', 'GridView', 'ListView', 'Stack']
    },
    "Material": {
      "expanded": false,
      "items": ['Appbar', 'BottomNavigationBar', 'Drawer', 'TabBar']
    },
    "Buttons": {
      "expanded": false,
      "items": ['ButtonBar', 'DropdownButton', 'FlatButton', 'FloatingActionButton', 'IconButton', 'PopupMenuButton', 'RaisedButton']
    }
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsList = List<Widget>();
    widgetsList.add(Padding(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Container(
        child: Text(
          'Lista de Widgets',
          style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize),
        ),
      ),
    ));

    mapWidgetsList.forEach((String category, dynamic widgets) {
      widgetsList.add(Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: ExpansionPanelList(
          expansionCallback: (int i, bool status) {
            setState(() {
              // Fecha todos os outros
              mapWidgetsList.forEach((String cat, w) {
                if (cat != category) {
                  mapWidgetsList[cat]['expanded'] = false;
                }
              });

              // Troca o status apenas do item clicado
              mapWidgetsList[category]['expanded'] = !status;
            });
          },
          // animationDuration: Duration(milliseconds: 500),
          children: [
            ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Text(category, style: Theme.of(context).textTheme.title),
                );
              },
              body: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: this._gridItems(widgets['items']),
                ),
                height: MediaQuery.of(context).size.height / 4,
              ),
              isExpanded: widgets['expanded'],
            )
          ],
        ),
      ));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetsList,
    );
  }

  List<Widget> _gridItems(List<String> items) {
    List<Widget> result = List<Widget>();

    items.forEach((i) {
      Container container = Container(
        color: Colors.blue,
        child: Center(child: Text(i, style: Theme.of(context).textTheme.title)),
        width: 100,
        height: 100,
      );

      result.add(Padding(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () => print(i),
          child: Draggable(
            data: [i],
            child: container,
            feedback: container,
          ),
        ),
      ));
    });

    return result;
  }
}
