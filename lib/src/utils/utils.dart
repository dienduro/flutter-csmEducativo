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
