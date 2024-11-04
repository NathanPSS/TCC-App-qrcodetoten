

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodetotens/models/setor.dart';
import 'package:qrcodetotens/widgets/auth_edit_qrcode_form.dart';
import 'package:qrcodetotens/widgets/login_form.dart';

class QrCodeScreen extends StatelessWidget {
   const QrCodeScreen({super.key,required this.data});

  final Map<String,dynamic> data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
         automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (ctx) {
              return Dialog(
                child: AuthEditQrCodeForm(),
              );
            });
          }, icon: Icon(MdiIcons.qrcodeEdit))
        ],
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Text("${data['nome']}",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
          margin: EdgeInsets.all(35),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                  'Abra o aplicativo e leia o QRCode a seguir para realizar o Check-In',
                  style: GoogleFonts.prompt(
                      fontSize: 50,
                      fontWeight: FontWeight.w200
                  )
              ),
              const SizedBox(height: 100),
              Center(
                child: QrImageView(
                  data: json.encode(data),
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                ),

              ),
            ],
          )),
    );
  }
}