import 'package:flutter/material.dart';
import 'package:my_app/Component/drawer_component.dart';
import 'package:my_app/helper/parser.dart';

class DrawerBuilder extends StatelessWidget {
  Map<String, dynamic> drawerMap = {};
  DrawerBuilder(@required this.drawerMap);
  @override
  Widget build(BuildContext context) {
    print(drawerMap);
    return Column(
      children: [
        // Expanded(flex: 1, child: Container(color: Colors.transparent)),
        drawerMap.containsKey("top_component")
            ? topComponentParser(drawerMap["top_component"])
            : Container(),
        Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(
                  top: drawerMap.containsKey("top_component") ? 30.0 : 0),
              child: Column(
                  children: List.generate(drawerMap["items"].length,
                      (index) => DrawerItemMenu(drawerMap["items"][index]))),
            )),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              // color: Colors.cyan,
              child: drawerMap.containsKey("app_version")
                  ? Text(
                      "App Version ${drawerMap["app_version"]}",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  : Text(
                      "App Version 0.0.0",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
            ))
      ],
    );
  }
}
