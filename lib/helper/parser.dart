import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_app/builder/drawer_builder.dart';
import 'package:my_app/helper/service.dart';

Color colorParser(String color) {
  String colorParser = "0xFF$color";
  return Color(int.parse(colorParser));
}

EdgeInsets paddingMarginParser(Map<String, dynamic> map) {
  // print(map);
  EdgeInsets padding = EdgeInsets.zero;
  String paddingType = map['type'];

  switch (paddingType) {
    case "all":
      // print("$paddingType selected");
      padding = EdgeInsets.all(map["value"]);
      break;
    case "fromLTRB":
      // print("$paddingType selected");
      padding = EdgeInsets.fromLTRB(
        map["left"],
        map["top"],
        map["right"],
        map["bottom"],
      );
      break;
    case "symmetric":
      // print("$paddingType selected");
      padding = EdgeInsets.symmetric(
        horizontal: map["horizontal"],
        vertical: map["vertical"],
      );
      break;
    default:
      padding = EdgeInsets.zero;
  }
  return padding;
}

TextStyle textStyleParser(Map<String, dynamic> map) {
  TextStyle textStyle = TextStyle();

  return textStyle;
}

Icon iconsParser(String icon, double size) {
  IconData iconData = Icons.person;
  switch (icon) {
    case "account_circle":
      return Icon(
        Icons.account_circle,
        size: size,
      );
      break;
    case "ac_unit":
      return Icon(
        Icons.ac_unit,
        size: size,
      );
      break;
    case "access_alarm":
      return Icon(
        Icons.access_alarm,
        size: size,
      );
      break;
    case "location_on":
      return Icon(
        Icons.location_on,
        size: size,
      );
      break;
    case "location_off":
      return Icon(
        Icons.location_off,
        size: size,
      );
      break;
    case "location_disabled":
      return Icon(
        Icons.location_disabled,
        size: size,
      );
      break;
    case "menu":
      return Icon(
        Icons.menu,
        size: size,
      );
      break;
    case "restaurant_menu":
      return Icon(
        Icons.restaurant_menu,
        size: size,
      );
      break;
    default:
      print("Icon not found");
      return Icon(
        Icons.error,
        size: size,
      );
  }
}

Drawer drawerParser(Map<String, dynamic> map) {
  // print(map);
  Drawer drawer = Drawer(
    child: DrawerBuilder(map),
  );
  return drawer;
}

Widget topComponentParser(Map<String, dynamic> map) {
  // print(map);
  switch (map["type"]) {
    case "text":
      return Expanded(
          child: Container(
        color: map.containsKey("bg_color")
            ? colorParser(map["bg_color"])
            : Colors.transparent,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 30.0, left: 20),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              map["title"],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(map["subtitle"])
          ],
        ),
      ));
      break;
    case "profile":
      return Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.only(top: 40),
            width: double.infinity,
            color: map.containsKey("bg_color")
                ? colorParser(map["bg_color"])
                : Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  map["hint_text"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(map["sub_text"])
              ],
            ),
          ));
      break;
    case "none":
      return Container();
      break;
    default:
      return Container();
  }
}

void navigatorParser(BuildContext context, Map<String, dynamic> map) {
  String type = map["type"];
  var data = {};
  Map<String, dynamic> itemData = {};

  loadFromJson().then((value) {
    // print("data pages = $value");
    data = value;
    // print("data: $data");
    for (var item in data["pages"]) {
      if (item["page_name"] == map["route_name"]) {
        itemData = item;
        print("item $itemData");
      }
    }
    switch (type) {
      case "pushNamed":
        Navigator.pushNamed(context, map["route_name"], arguments: itemData);
        break;
      case "pushNamedAndRemoveUntil":
        Navigator.pushNamedAndRemoveUntil(
            context, map["route_name"], (Route route) => false);
        break;
      case "pop":
        Navigator.pop(context);
        break;
      case "pushReplacementNamed":
        Navigator.pushReplacementNamed(context, map["route_name"]);
        break;
      default:
        Navigator.pushNamed(context, map["route_name"].toString(),
            arguments: itemData);
    }
  });
}

List<Widget> tabbarItemParser(Map<String, dynamic> map) {
  List<Widget> tabBarITem = [];
  for (var item in map["tabbar_items"]) {
    tabBarITem.add(Container(
      child: Column(
        children: [
          item.containsKey("icon")
              ? Container(
                  alignment: Alignment.center,
                  child: iconsParser(item["icon"], item["icon_size"] ?? 22),
                )
              : Container(),
          item.containsKey("label")
              ? Container(
                  alignment: Alignment.center, child: Text(item["label"]))
              : Container(),
        ],
      ),
    ));
  }
  return tabBarITem;
}

List<Widget> tabbarBodyParser(
    {@required Map<String, dynamic> map, Map<String, dynamic> itemMaps}) {
  List<Widget> tabbarBody = [];
  for (var item in map["tabbar_bodies"]) {
    switch (item["type"]) {
      case "list_view":
        // tabbarBody.add(listViewParser(item));
        break;
      default:
    }
  }
  return tabbarBody;
}

Widget listViewParser(Map<String, dynamic> map, Map<String, dynamic> data) {
  ListView listView;
  listView = ListView(
      children: List.generate(data["list_item"].length,
          (index) => widgetListItemParser(data["list_item"][index])));
  return listView;
}

Widget widgetListItemParser(Map<String, dynamic> map) {
  return ListTile(
    leading: map.containsKey("leading") ? widgetParser(map["leading"]) : null,
    title: map.containsKey("title") ? widgetParser(map["title"]) : null,
    subtitle:
        map.containsKey("subtitle") ? widgetParser(map["subtitle"]) : null,
    trailing:
        map.containsKey("trailing") ? widgetParser(map["trailing"]) : null,
  );
}

Widget widgetParser(Map<String, dynamic> map) {
  if (map.containsKey("text")) {
    return Text(map["text"]);
  } else if (map.containsKey("icon")) {
    return iconsParser(map["icon"], map["icon_zise"] ?? 20);
  } else if (map.containsKey("img")) {
    return Container();
  } else {
    return Container();
  }
}

Widget imageParser(Map<String, dynamic> map) {}

List<BoxShadow> boxshadowParser(Map<String, dynamic> map) {
  List<BoxShadow> boxShadow = [];
}
