import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';
import 'package:flutter_csm_tecnologia/src/models/user_model.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
import 'package:http/http.dart' as http;
/* import 'package:crypto/crypto.dart'; */

class UsuarioProvider {
  LoginBloc userBloc;
  final prefs = new UserPreferences();
  final _dio = new Dio();

  Future<List<Login>> login(String user, String pass) async {
    /* TODO:HACER ALGO PARA RECIBIR LA INFOR DE LA API Y QUE ME DEVUELVA SI ES VALIDO O NO */

    /* final authData = {
      'codigo': user,
      'clave': pass,
    }; */
    final user = '';
    final pass = '';
    try {
      final url = 'http://demo.csmeducativo.com/Servicios/sesion';
      final resp = await _dio.get(url, queryParameters: {
        'codigo': user,
        'clave': pass,
      });
      print(resp.data);

      Map<String, dynamic> decodeResp = json.decode(resp.data);

      /* print(decodeResp); */

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
