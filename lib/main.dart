import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Component/menu_item_component.dart';
import 'package:my_app/builder/grid_menu_builder.dart';
import 'package:my_app/builder/list_menu_builder.dart';
import 'package:my_app/builder/loading_page_builder.dart';
import 'package:my_app/builder/main_page_builder.dart';
import 'package:my_app/helper/route_generator.dart';
import 'package:my_app/helper/service.dart';
import 'package:my_app/provider.dart/my_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MyProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        onGenerateRoute: Router2.generatorRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> data = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFromJson().then((value) {
      // print(value);
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? LoadingPageBuilder()
        : MainPageBuilder(data["pages"][0]);
  }
}
