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
        : sink.addError('no es un usuario valido');
  });

  final validarPsswrd =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    final n = num.tryParse(pass);

    if (n == null) {
      sink.addError('Solo numeros por favor');
    } else if (pass.isEmpty) { 
      /* pass = digest; */
      sink.addError('ingrese una constraseña');
    } else {
      return sink.add(pass);
    }
  });
}
