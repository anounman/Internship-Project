import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:internship_2/model/page_data.dart';
import 'package:http/http.dart' as http;

class ServiceProvider {
  Future<PageData> getData() async {
    final responce = await http.get(
        Uri.parse("https://webhook.site/5f99cb75-290f-466c-be55-5fbba336fb37"));
    debugPrint(responce.statusCode.toString());
    if (responce.statusCode == 200) {
      return PageData.fromJson(json.decode(responce.body));
    } else {
      throw Exception();
    }
  }
}
