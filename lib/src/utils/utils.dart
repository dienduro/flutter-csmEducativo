import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('informacion Incorrecta'),
        content: Text(mensaje),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}

/* void mostrarAlertaSplash(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('no hay acceso al servidor'),
        content: Text(mensaje),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
} */

void mostrarAlertaUser(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Esta seguro de cerrar sesion ?'),
        content: Text(mensaje),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).popAndPushNamed('home'),
            child: Text('Si'),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
/*  void mostarSnackbar(String mensaje) {
      final snackbar = SnackBar(
        content: Text(mensaje),
        duration: Duration(milliseconds: 1500),
      );

      scaffoldmKey.currentState.showSnackBar(snackbar);
    } */
