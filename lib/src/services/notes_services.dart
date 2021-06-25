/* codigo limpio */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_csm_tecnologia/src/models/notas_model.dart';

class NoteServices with ChangeNotifier {
  List<Dato> datos = new List();
  List<Asignatura> asignaturas = new List();
  NoteServices() {
    getAreas();
  }
  String _url = 'assets/drawable-fhd/notas_json.json';

  getAreas() async {
    final resp = await rootBundle.loadString(_url);
    final decodeData = calificacionesFromJson(resp);
    datos.addAll(decodeData.datos);

    decodeData.datos.forEach((element) {
      asignaturas.addAll(element.asignaturas);
    });
    print(asignaturas);

    notifyListeners();
  }
}
