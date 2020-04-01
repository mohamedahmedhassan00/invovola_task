import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:inovola_task/model/Response.dart';


class ApiRequest extends ChangeNotifier {
  Future<Response> printResponse() async {
    final String url = 'http://skillzycp.com/api/UserApi/getOneOccasion/389/0';
    final currentResponse = await http.get(url);
    String string = currentResponse.body.replaceAll("https", "http") ;
    final data = json.decoder.convert(string);
    Response response = Response.fromJson(json.decode(data));
   // print("this is response " + response.title) ;
    return response;
  }
}
