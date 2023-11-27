import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


Future<List<Map<String,dynamic>>> getAllSetores() async {
  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/setor/all');
  final response = await http.get(
    url,
  );
  debugPrint(List<Map<String, dynamic>>.from(json.decode(response.body)).toString());
  return List<Map<String, dynamic>>.from(json.decode(response.body));
}