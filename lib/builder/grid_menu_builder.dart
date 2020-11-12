import 'package:flutter/material.dart';
import 'package:my_app/Component/grid_menu_component.dart';

class GridMenuBuilder extends StatelessWidget {
  Map<String, dynamic> data;
  GridMenuBuilder(@required this.data);

  @override
  Widget build(BuildContext context) {
    print(data);
    return GridView.count(
      // childAspectRatio: 1 / 0.5,
      crossAxisCount: 2,
      // crossAxisSpacing: 8,
      // mainAxisSpacing: 12,
      children: List.generate(data["menu"]["menu_items"].length,
          (index) => GridMenuComponent(data["menu"]["menu_items"][index])),
    );
  }
}
