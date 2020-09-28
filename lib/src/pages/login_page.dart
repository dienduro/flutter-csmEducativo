import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user_shcl.dart';

class LoginPage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hola Mundo${prefs.school}'),
      ),
    );
  }
}
