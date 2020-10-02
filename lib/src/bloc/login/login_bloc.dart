import 'dart:async';

import 'package:flutter_csm_tecnologia/src/bloc/login/login_validators.dart';

class LoginBloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

//recuperar los datos escuchado del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get paswordStream =>
      _passwordController.stream.transform(validarPsswrd);
  //Insaertar valores Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
