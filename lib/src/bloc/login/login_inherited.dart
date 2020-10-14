import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

export 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

class LoginInherited extends InheritedWidget {
  static LoginInherited _instancia;

/* hacer que aunque yo haga el hotrestar se mantenga esa informacion cuando yo cambie de pantalla y se matenga esa misma informacion */
  final loginBloc = LoginBloc();

  factory LoginInherited({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new LoginInherited._internal(
        key: key,
        child: child,
      );
    }

    return _instancia;
  }
/* patron singleton */
  LoginInherited._internal({Key key, Widget child})
      : super(
          key: key,
          child: child,
        );

  static LoginBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginInherited>()
        .loginBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
