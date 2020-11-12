import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/builder/form_page_builder.dart';
import 'package:my_app/builder/form_update_page_builder.dart';
import 'package:my_app/builder/main_page_builder.dart';
import 'package:my_app/builder/not_found_page.dart';

class Router {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (ctx) => MainPageBuilder(settings.arguments));
        break;
      case 'menu_2':
        return MaterialPageRoute(
            builder: (ctx) => MainPageBuilder(settings.arguments));
        break;
      case 'page2':
        return MaterialPageRoute(
            builder: (ctx) => MainPageBuilder(settings.arguments));
        break;
      case 'input':
        return MaterialPageRoute(
            builder: (ctx) => InputPageBuilder(
                  data: settings.arguments,
                ));
        break;
      case 'update':
        return MaterialPageRoute(
            builder: (ctx) => UpdatePageBuilder(settings.arguments));
        break;
      default:
        return MaterialPageRoute(builder: (ctx) => NotFoundPage());
    }
  }
}
