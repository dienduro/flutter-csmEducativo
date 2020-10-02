import 'dart:async';

import 'package:flutter_csm_tecnologia/src/bloc/login/login_validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  /* los conbinelettesr no trabaja con Stream controller osea el rxdart tiene una funcion para trabajar con ella es el behaviorSubject */
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

//recuperar los datos escuchado del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get paswordStream =>
      _passwordController.stream.transform(validarPsswrd);

  /* añnado la opcion para validar los  dos stream con combinelatestStream  */
  Stream<bool> get loginValidStreamRx =>
      Rx.combineLatest2(emailStream, paswordStream, (e, p) => true);
  //Insaertar valores Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
