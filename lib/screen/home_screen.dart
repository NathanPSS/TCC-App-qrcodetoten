

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qrcodetotens/api/setor.dart';
import 'package:qrcodetotens/screen/qr_code_screen.dart';


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(35),

          child: Column(
            children: [
             const Center(
                child: Text("Selecione Um dos Setores Disponiveis",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
              FutureBuilder(
                future: getAllSetores(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                 if(snapshot.connectionState == ConnectionState.done){
                   return Container(
                     decoration: BoxDecoration(

                     ),

                     child: GridView.count(crossAxisCount: 4,

                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       children: List.generate(snapshot.data.length, (index) {
                         return Container(
                              margin: EdgeInsets.only(left: 40,right: 40,bottom: 40),
                             child: TextButton(
                                 onPressed: (){
                                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>QrCodeScreen(data: snapshot.data[index])));
                                 },
                                 child: AutoSizeText(
                                   snapshot.data[index]['nome'],
                                   maxLines: 1,
                                   minFontSize: 24,
                                   style: TextStyle(fontSize: 40),
                                 )));
                       }),
                     ),
                   );
                 }
                 return CircularProgressIndicator();
              },)
            ]
          ),
    ));
  }
}