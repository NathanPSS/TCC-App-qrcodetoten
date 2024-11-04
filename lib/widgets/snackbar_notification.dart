
import 'package:flutter/material.dart';

import '../global/dimensions_device.dart';

SnackBar notificationSnackBar(BuildContext ctx,Color bgColor,Color textColor,String message){
  return SnackBar(
    backgroundColor: bgColor,
    content: Container(
        alignment: Alignment.center,
        height: 120, child:
    Text(message,style: TextStyle(color: textColor,fontSize: 20),)
    ),
    //  width: 200,
    margin: EdgeInsets.only(bottom: getDeviceHeight(context: ctx) * 0.7,right: getDeviceWith(context: ctx) * 0.7,left: 40,top: 40),
    behavior: SnackBarBehavior.floating,
  );
}
void showNotificationSnackBar(BuildContext ctx,Color bgColor,Color textColor,String message){
  ScaffoldMessenger.of(ctx).showSnackBar(notificationSnackBar(ctx, bgColor, textColor, message));
}
void showNotificationSnackBarFail(BuildContext ctx,String message){
  ScaffoldMessenger.of(ctx).showSnackBar(notificationSnackBar(ctx,Colors.redAccent[100]!, Colors.white, message));
}

void showNotificationSnackBarSucess(BuildContext ctx,String message){
  ScaffoldMessenger.of(ctx).showSnackBar(notificationSnackBar(ctx, Colors.greenAccent[100]!, Colors.black, message));
}
