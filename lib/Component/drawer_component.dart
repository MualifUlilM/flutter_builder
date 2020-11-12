import 'package:flutter/material.dart';
import 'package:my_app/helper/parser.dart';

class DrawerItemMenu extends StatelessWidget {
  Map<String, dynamic> item = {};
  DrawerItemMenu(@required this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          leading:
              item.containsKey("icon") ? iconsParser(item["icon"], 20) : null,
          title: item.containsKey("title")
              ? Text(
                  item["title"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              : Container()),
    );
  }
}
