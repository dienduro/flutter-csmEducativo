import 'dart:async';

/* import 'dart:convert';

import 'package:crypto/crypto.dart'; */

class Validators {
  final validateUser =
      StreamTransformer<String, String>.fromHandlers(handleData: (user, sink) {
    /* Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    (regExp.hasMatch(email))
        ? sink.add(email)
        : sink.addError('Email incorrecto'); */

    (user.isNotEmpty)
        ? sink.add(user)
        : sink.addError('Debe ingresar el usuario');
  });

  final validarPsswrd =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.isEmpty) {
      sink.addError('Debe ingresar la contraseña');
    } else {
      return sink.add(pass);
    }
  });
}
