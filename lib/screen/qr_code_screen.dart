

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodetotens/models/setor.dart';

class QrCodeScreen extends StatelessWidget {
   const QrCodeScreen({super.key,required this.data});

  final Map<String,dynamic> data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(35),
          child: Column(
            children: [
              const SizedBox(height: 65),
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