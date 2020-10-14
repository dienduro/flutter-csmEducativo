import 'package:dio/dio.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';
import 'package:flutter_csm_tecnologia/src/models/user_model.dart';
/* import 'package:flutter_csm_tecnologia/src/models/user_model.dart'; */
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
/* import 'package:http/http.dart' as http;
 */ /* import 'package:crypto/crypto.dart'; */

class UsuarioProvider {
  LoginBloc userBloc;
  final _prefs = new UserPreferences();
  final _dio = new Dio();

  Future<Map<String, dynamic>> login(String user, String pass) async {
    /* TODO:HACER ALGO PARA RECIBIR LA INFOR DE LA API Y QUE ME DEVUELVA SI ES VALIDO O NO */

    final authData = {
      'codigo': user,
      'clave': pass,
    };

    try {
      final url = 'http://demo.csmeducativo.com/Servicios/sesion';
      final resp = await _dio.get(url, queryParameters: authData);

      final Map<String, dynamic> decodeResp = resp.data;

      print(decodeResp);

      if (decodeResp['estado'] == true) {
        //TODO:salvar el id usuario en el storage
        _prefs.idUser = decodeResp['datos']['usuario']['idUsuario'];

        print('contiene datos');
        return {'estado': true, 'usuario': decodeResp['datos']['usuario']};
      } else {
        print('no contiene datos');
        return {'estado': false, 'mensaje': decodeResp['mensaje']};
      }

      /*  LoginModel decodeResp = LoginModel.fromJson(map); */

    } catch (e) {
      print(e);
      return {};
    }
  }
}