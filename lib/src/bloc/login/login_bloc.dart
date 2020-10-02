import 'dart:async';

import 'package:flutter_csm_tecnologia/src/bloc/login/login_validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  /* los conbinelettesr no trabaja con Stream controller osea el rxdart tiene una funcion para trabajar con ella es el behaviorSubject */
  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

//recuperar los datos escuchado del stream
  Stream<String> get userStream =>
      _userController.stream.transform(validateUser);
  Stream<String> get paswordStream =>
      _passwordController.stream.transform(validarPsswrd);

  /* añnado la opcion para validar los  dos stream con combinelatestStream  */
  Stream<bool> get loginValidStreamRx =>
      Rx.combineLatest2(userStream, paswordStream, (e, p) => true);
  //Insaertar valores Stream
  Function(String) get changeUser => _userController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

/* obtener el ultimo valor ingresado a los streams */
  String get lastUser => _userController.value;
  String get lastPsswrd => _passwordController.value;

  dispose() {
    _userController?.close();
    _passwordController?.close();
  }
}
