import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';

class InstitucionesProvider {
  final String _url = '193123dde057.ngrok.io';

  Future<List<InstitucionModel>> getInstituciones() async {
    final url = Uri.http(_url, "api/institutes");

    final resp = await http.get(url);
    final List decodedData = json.decode(resp.body);
    /* creo una lista vacio para dejarlo en el foreach en una lista temporal */
    final List<InstitucionModel> institutos = new List();
    if (decodedData == null) return [];

    decodedData.forEach((element) {
      final instTemp = InstitucionModel.fromJson(element);
      /* agregamos la lista interadad a la lista vacia de instituciones */
      institutos.add(instTemp);
    });
    /* con esto se crea un instancia para nuestra lista y luego si poder pintarlo en pantalla */
    /* print(institutos[0].nombre); */

    return institutos;
  }

  /* Future<List<Institucion>> _procesarRespUrl(String query) async {} */
}
