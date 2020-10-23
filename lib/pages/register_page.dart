import 'package:chatapp/widgets/btn_azul.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/widgets/custom_input.dart';
import 'package:chatapp/widgets/labels_input.dart';
import 'package:chatapp/widgets/logo_input.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo:' Registro',),
                _Form(),
                Labels(ruta:'login',text1: '¿Ya tienes una Cuenta?', text2: 'Ingresa aca!',),
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
  @override
  Widget build(BuildContext context) {
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final nameCtrl = TextEditingController();
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
           textButton: 'Ingresar',
           onPressed: (){
             print(emailCtrl.text);
             print(passCtrl.text);
           },
           ),
        ],
      ),
    );
  }
}


