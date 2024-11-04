import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../global/storage.dart';



Future<bool> setToken(String username,String password) async {
  try{
    debugPrint(username + password);
    final url = Uri.parse(
        '${dotenv.env['API_BASE_URL']!}/admin/auth');
    final response = await http.post(
      url,
      body: json.encode({'username': username,'password': password}),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print("Ok");
      await storage.write(key: "qrcode_toten_jwt_token",value: response.body);
      return true;
    }
    print("r");
    return false;
  }
  catch(e){
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> hasValidToken() async {

  var existsToken = await storage.read(key:"desktop_jwt_token");

  if(existsToken != null){
    var token = json.decode((existsToken))['expireAt'];
    if(isValidToken(token)){
      return true;
    }
    return false;
  }
  return false;
}
bool isValidToken(String expireAt) {
  return DateTime.now().isBefore(DateTime.parse(expireAt));
}