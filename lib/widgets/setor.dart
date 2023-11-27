

import 'package:flutter/material.dart';

class Setor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(300))
      ),
      width: 300,
      height: 300,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder()
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.red,),
              Text("data",style: TextStyle(color: Colors.black),)
            ],
          ) ),
    );
  }
}