import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';
export 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

class LoginProvider with ChangeNotifier {
  LoginBloc _loginBloc;

  LoginBloc get loginUser => this._loginBloc;
  bool get existeUsuario => (this._loginBloc != null) ? true : false;

  set insertarUsuario(LoginBloc setUser) {
    this._loginBloc = setUser;
    notifyListeners();
  }
}
