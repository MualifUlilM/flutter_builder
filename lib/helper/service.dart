import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> loadFromJson() async {
  print("executed");
  var data = await rootBundle.loadString("assets/text.json");
  Map<String, dynamic> json = jsonDecode(data);
  return json;
}

class API {
  String baseUrl = "https://energibangsa.id/uin_lib/api";

  Future getData({@required String endPoint, String token}) async {
    Uri url = Uri.parse("$baseUrl/$endPoint");
    print(url.path);
    try {
      var res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        return data;
      } else {
        return {'status': 0, 'error': res.body};
      }
    } catch (e) {
      print(e);
    }
  }

  Future postApi(
      {@required String endPoint,
      String token,
      Map<String, dynamic> body}) async {
    Uri url = Uri.parse("$baseUrl/$endPoint");
    print(url.path);
    try {
      var res = await http.post(url, body: body, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (res.statusCode == 200) {
        print(res.body);
        var data = json.decode(res.body);
        return data;
      } else {
        return {'status': 0, 'error': res.body};
      }
    } catch (e) {
      print(e);
    }
  }
}
