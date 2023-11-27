

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qrcodetotens/screen/home_screen.dart';
import 'package:qrcodetotens/screen/setores.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(
      MaterialApp(
      home: HomeScreen(),
  ));

}