

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcodetotens/widgets/setor.dart';

class SetoresScreen extends StatelessWidget {
  const SetoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         children: [
           Row(
             children: [
               Setor(),
             ],
           ),
           Setor(),
         ],
       ),
     );
  }
}