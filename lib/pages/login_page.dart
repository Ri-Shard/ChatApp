import 'package:chatapp/helpers/mostrar_alerta.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/widgets/btn_azul.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/widgets/custom_input.dart';
import 'package:chatapp/widgets/labels_input.dart';
import 'package:chatapp/widgets/logo_input.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(
                    titulo: 'Login',
                  ),
                  _Form(),
                  Labels(
                    ruta: 'register',
                    text1: '¿No tienes una cuenta?',
                    text2: 'Crea una Aqui!',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          BtnAzul(
             textButton: 'Ingrese',
             onPressed: authService.autenticando ? null : () async {

               FocusScope.of(context).unfocus();

               final loginOk = await authService.login( emailCtrl.text.trim(), passCtrl.text.trim() );

                if ( loginOk ) {
                  // TODO: Conectar a nuestro socket server
                  Navigator.pushReplacementNamed(context, 'usuarios');
                } else {
                  // Mostara alerta
                  mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales nuevamente');
                }

             },
          ),
        ],
      ),
    );
  }
}
