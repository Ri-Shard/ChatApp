import 'package:chatapp/models/mensajes_response.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chatapp/global/enviroment.dart';
import 'package:chatapp/models/usuario.dart';



class ChatService with ChangeNotifier {

  Usuario usuarioPara;


  Future<List<Mensaje>> getChat( String usuarioID ) async {

    final resp = await http.get('${ Environment.apiUrl }/mensajes/$usuarioID',
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;


  }



}

