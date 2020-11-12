import 'package:flutter/material.dart';
import 'package:my_app/helper/parser.dart';

class GridMenuComponent extends StatelessWidget {
  Map<String, dynamic> item;
  GridMenuComponent(@required this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 95,
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: item.containsKey("color")
              ? colorParser(item["color"])
              : Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(6, 10), blurRadius: 6, color: Colors.grey[300])
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              // height: 95,
              // width: 95,
              alignment: Alignment.center,
              child: item.containsKey("icon")
                  ? iconsParser(item["icon"], 50)
                  : null),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            // height: 95,
            // width: 95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    item["title"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
