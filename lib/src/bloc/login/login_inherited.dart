import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

export 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

class LoginInherited extends InheritedWidget {
  static LoginInherited _instancia;

  factory LoginInherited({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new LoginInherited._internal(
        key: key,
        child: child,
      );
    }

    return _instancia;
  }

  LoginInherited._internal({Key key, Widget child})
      : super(
          key: key,
          child: child,
        );

  final loginBloc = LoginBloc();

  static LoginBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginInherited>()
        .loginBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
