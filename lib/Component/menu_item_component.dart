import 'package:flutter/material.dart';
import 'package:my_app/helper/parser.dart';

class MenuItemComponent extends StatelessWidget {
  Map<String, dynamic> item;
  MenuItemComponent({@required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(item["navigator"]);
        // print(item.containsKey("margin"));
        if (item.containsKey("navigator")) {
          navigatorParser(context, item["navigator"]);
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: item.containsKey("height")
            ? MediaQuery.of(context).size.height * item['height']
            : MediaQuery.of(context).size.height * 0.1,
        width: item.containsKey("height")
            ? MediaQuery.of(context).size.width * item['width']
            : MediaQuery.of(context).size.width * 0.8,
        padding: item.containsKey("padding")
            ? paddingMarginParser(item['padding'])
            : EdgeInsets.zero,
        margin: item.containsKey("margin")
            ? paddingMarginParser(item['margin'])
            : EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: item.containsKey("color")
                ? colorParser(item['color'])
                : Theme.of(context).primaryColor,
            borderRadius: item.containsKey("radius")
                ? BorderRadius.circular(item['radius'])
                : BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300], blurRadius: 6, offset: Offset(6, 6))
            ]),
        child: ListTile(
          title: Text(
            item['title'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          leading:
              item.containsKey("icon") ? iconsParser(item['icon'], 50) : null,
          // leading: Container(
          //   height: 50,
          //   width: 50,
          // ),
        ),
      ),
    );
  }
}
