import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qrcodetotens/screen/home_screen.dart';
import 'package:qrcodetotens/screen/qr_code_screen.dart';
import 'package:qrcodetotens/widgets/snackbar_notification.dart';

import '../api/auth.dart';
import '../global/dimensions_device.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(214, 214, 214,1),width: 3)),
            margin: EdgeInsets.only(left: 0,top: getDeviceHeight(context: context) * 0.2,bottom: getDeviceHeight(context: context) * 0.2),
            padding: EdgeInsets.only(left: 16,right: 16,top: 16),
            width: 360,
            height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: getDeviceHeight(context: context) * 0.04),
                        TextFormField(
                          scrollPadding: EdgeInsets.only(bottom: 300),
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
                     SizedBox(height: 40,),
                    TextFormField(
                         obscureText: true,
                         scrollPadding: EdgeInsets.only(bottom: 200),
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
                  SizedBox(height: getDeviceHeight(context: context) * 0.06),
                  Container(
                      width: 160,
                          height: 54,
                          margin: EdgeInsets.only(left: 200),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(89, 76, 239, 1.0)
                                ),
                                onPressed: () {
                                  setToken(_usernameFieldController.text, _passwordFieldController.text).then((value) {
                                    if(value){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
                                    } else {
                                      showNotificationSnackBarFail(context, "Ocorreu um erro  novamente mais tarde");
                                    }
                                  }
                                  );
                                },
                                child:  Text('Entrar',style: TextStyle(color: Colors.white,
                                    fontSize:
                                    getAverageDeviceSize(context: context) * 0.02
                                ),)),
                          ),
                        ),
                ],
            ),
          ),
        ),
      );
  }
}
