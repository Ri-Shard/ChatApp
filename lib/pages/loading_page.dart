import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot) {
            return Center(
              child: Text('Espere...'),
            );
          }),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);
    final autenticado = await authService.IsLoggedIn();

    if (autenticado) { 
      
      socketService.connect();
      Navigator.pushReplacementNamed(context, 'usuarios');
    } else {

      socketService.connect();
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
