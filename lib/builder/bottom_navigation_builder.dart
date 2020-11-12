import 'package:flutter/material.dart';
import 'package:my_app/helper/parser.dart';

class BottomNavigationBuilder extends StatefulWidget {
  Map<String, dynamic> data;
  BottomNavigationBuilder(this.data);
  @override
  _BottomNavigationBuilderState createState() =>
      _BottomNavigationBuilderState();
}

class _BottomNavigationBuilderState extends State<BottomNavigationBuilder> {
  int _index = 0;
  List<BottomNavigationBarItem> items = [];
  Color bg_color;
  void onTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (Map<String, dynamic> item in widget.data["items"]) {
      items.add(BottomNavigationBarItem(
          icon: item.containsKey("icon") ? iconsParser(item["icon"], 25) : null,
          title: item.containsKey("label") ? Text(item["label"]) : null));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize:
          widget.data.containsKey("icon_size") ? widget.data["icon_size"] : 100,
      items: items,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.blue,
      onTap: onTapped,
      currentIndex: _index,
    );
  }
}
