import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

class LoginInherited extends InheritedWidget {
  final LoginBoloc loginBoloc;
  final Widget child;
  LoginInherited({
    Key key,
    this.child,
    this.loginBoloc,
  }) : super(key: key, child: child);

  static LoginInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginInherited>();
  }

  @override
  bool updateShouldNotify(LoginInherited oldWidget) {
    return true;
  }
}
