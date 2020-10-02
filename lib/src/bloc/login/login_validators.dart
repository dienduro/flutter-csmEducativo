import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    /* Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    (regExp.hasMatch(email))
        ? sink.add(email)
        : sink.addError('Email incorrecto'); */

    (email.length >= 8)
        ? sink.add(email)
        : sink.addError('no es un usuario valido');
  });

  final validarPsswrd =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.length >= 6) {
      sink.add(pass);
    } else {
      sink.addError('Mas de 6 caracteres.');
    }
  });
}
