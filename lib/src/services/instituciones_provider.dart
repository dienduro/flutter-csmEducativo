import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';

class InstitucionesProvider {
  bool urlDone = false;
  Future<List<InstitucionModel>> getInstituciones() async {
    try {
      final String _url = '192.168.101.25';
      final url = Uri.http(_url, "api/institutes");
      final resp = await http.get(url);
      final List decodedData = json.decode(resp.body);
      final List<InstitucionModel> institutos = new List();
      if (decodedData == null) {
        urlDone = false;
        return [];
      }
      decodedData.forEach((element) {
        final instTemp = InstitucionModel.fromJson(element);
        institutos.add(instTemp);
      });
      urlDone = true;
      return institutos;
    } catch (e) {
      urlDone = false;
      print(e);
      return [];
    }

    /* creo una lista vacio para dejarlo en el foreach en una lista temporal */

    /* agregamos la lista interadad a la lista vacia de instituciones */

    /* con esto se crea un instancia para nuestra lista y luego si poder pintarlo en pantalla */
    /* print(institutos[0].nombre); */
  }

  /* Future<List<Institucion>> _procesarRespUrl(String query) async {} */
}
