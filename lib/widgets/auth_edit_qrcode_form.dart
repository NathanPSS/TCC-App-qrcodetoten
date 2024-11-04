
import 'package:flutter/material.dart';
import 'package:qrcodetotens/screen/home_screen.dart';

import 'package:qrcodetotens/widgets/snackbar_notification.dart';

import '../api/auth.dart';
import '../global/dimensions_device.dart';


class AuthEditQrCodeForm extends StatefulWidget {
  const AuthEditQrCodeForm({super.key});

  @override
  State<AuthEditQrCodeForm> createState() => _AuthEditQrCodeFormState();
}

class _AuthEditQrCodeFormState extends State<AuthEditQrCodeForm> {
  final TextEditingController _usernameFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();


  @override
  void dispose() {
    _usernameFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
     child: Container(
        //  decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(214, 214, 214,1),width: 3)),
          padding: EdgeInsets.only(left: 16,right: 16,top: 16),
          width: 240,
          height: 336,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  'Autenticação',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 24),
              TextFormField(

                controller: _usernameFieldController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    label: Text(
                      'Matricula',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              ),
              SizedBox(height: 32),
              TextFormField(

                obscureText: true,
                keyboardType: TextInputType.text,
                controller: _passwordFieldController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    label: Text(
                      'Senha',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              ),
              SizedBox(height: 24),
              Container(
                width: 120,
                height: 54,
                margin: EdgeInsets.only(left: 120),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(89, 76, 239, 1.0)
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setToken(_usernameFieldController.text, _passwordFieldController.text).then((value) {
                          if(value){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
                          } else {
                            showNotificationSnackBarFail(context, "Ocorreu um erro  novamente mais tarde");
                          }
                        }
                        );
                      },
                      child:  Text('Ok',style: TextStyle(color: Colors.white,
                          fontSize:
                          getAverageDeviceSize(context: context) * 0.02
                      ),)),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
