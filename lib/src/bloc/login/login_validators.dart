import 'dart:async';

class Validators {
  final validateUser =
      StreamTransformer<String, String>.fromHandlers(handleData: (user, sink) {
    /* Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    (regExp.hasMatch(email))
        ? sink.add(email)
        : sink.addError('Email incorrecto'); */

    (user.length >= 4)
        ? sink.add(user)
        : sink.addError('no es un usuario valido');
  });

  final validarPsswrd =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    final n = num.tryParse(pass);

    if (n == null) {
      sink.addError('Solo numeros por favor');
      /* TODO:VALIDAR LA ENTRADA DEL PASSWORD CON EL STRINGIN DE PASSWORD */
    } else {
      return sink.add(pass);
    }
/* aea88e9440c445013aa0acc127ea988d501cc4b5 */
    /*  sink.add(pass); */
  });
}
