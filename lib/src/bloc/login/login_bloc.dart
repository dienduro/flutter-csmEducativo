import 'dart:async';

import 'package:flutter_csm_tecnologia/src/bloc/login/login_validators.dart';
import 'package:rxdart/rxdart.dart';
/* import 'package:http/http.dart' as http; */

class LoginBloc with Validators {
  /* los conbinelettesr no trabaja con Stream controller osea el rxdart tiene una funcion para trabajar con ella es el behaviorSubject */
  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  /* TODO: INTEGRAR AL LOGINBLOC LOS DATOS QUE RECIBA DE LA API */

  /*  Future<List> login() async {
    final resp = await http.post("link base de datos login", body: {
      "username": _userController.value,
      "password": _passwordController.value,
    });
  } */

/*   Future login(String user, String password) async{

    final resp = await http.get('url')
  } */

//recuperar los datos escuchado del stream
  Stream<String> get userStream =>
      _userController.stream.transform(validateUser);
  Stream<String> get paswordStream =>
      _passwordController.stream.transform(validarPsswrd);

  /* añnado la opcion para validar los  dos stream con combinelatestStream  */
  Stream<bool> get loginValidStreamRx =>
      Rx.combineLatest2(userStream, paswordStream, (e, p) => true);
  /* TODO:BUSCAR LLA MANERA DE RXDAR TRAER LA DATA Y VALIDAR LA INFORMACION CON EL USER Y PASSWORD */
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
