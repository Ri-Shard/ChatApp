import 'package:chatapp/helpers/mostrar_alerta.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/widgets/btn_azul.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/widgets/custom_input.dart';
import 'package:chatapp/widgets/labels_input.dart';
import 'package:chatapp/widgets/logo_input.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
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
                    titulo: ' Registro',
                  ),
                  _Form(),
                  Labels(
                    ruta: 'login',
                    text1: '¿Ya tienes una Cuenta?',
                    text2: 'Ingresa aca!',
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
  final nameCtrl = TextEditingController();
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
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
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
             textButton: 'Crear cuenta',
             onPressed: authService.autenticando ? null : () async {
               print( nameCtrl.text );
               print( emailCtrl.text );
               print( passCtrl.text );
               final registroOk = await authService.register(nameCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());

               if ( registroOk == true ) {
                //  TODO: Conectar socket server
                Navigator.pushReplacementNamed(context, 'usuarios');
               } else {
                 mostrarAlerta(context, 'Registro incorrecto', registroOk );
               }

             },
          ),
        ],
      ),
    );
  }
}
