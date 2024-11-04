import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Row(
           children: [
             Container(
               child: Image.asset("images/Site-Stats-rafiki.png"),
             ),
             LoginForm(),
           ],
         ),
    );
  }

}