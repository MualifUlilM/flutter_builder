import 'package:flutter/material.dart';
import 'package:my_app/Component/menu_item_component.dart';

class ListMenuBuilder extends StatelessWidget {
  Map<String, dynamic> data = {};
  ListMenuBuilder({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(data['menu']['menu_items'].length, (index) {
          return Center(
            child: MenuItemComponent(
              item: data["menu"]['menu_items'][index],
            ),
          );
        }));
  }
}
