import 'package:dio/dio.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';

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
      final _url = '';
      final resp = await _dio.get(_url, queryParameters: authData);

      final Map<String, dynamic> decodeResp = resp.data;
      /* final List<Usuario> userList = new List(); */

      print(decodeResp);
      /* TODO: convertir los datos de la api pasrlos al modelo */

      if (decodeResp['estado'] == true) {
        //TODO:salvar el id usuario en el storage
        _prefs.idUser = decodeResp['datos']['usuario']['idUsuario'];
        _prefs.studentName = decodeResp['datos']['usuario']['nombreCompleto'];
        _prefs.fechaNacimiento =
            decodeResp['datos']['usuario']['fechaNacimiento'];
        _prefs.identificacion =
            decodeResp['datos']['usuario']['identificacion'];

        print('contiene datos');
        return {'estado': true, 'usuario': decodeResp['datos']['usuario']};
      } else {
        print('no contiene datos');
        return {'estado': false, 'mensaje': decodeResp['mensaje']};
      }

      /*  LoginModel decodeResp = LoginModel.fromJson(map); */

    } catch (e) {
      print(e.getMessage());
      return {};
    }
  }
}
