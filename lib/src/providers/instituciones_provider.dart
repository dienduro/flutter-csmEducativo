import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';

class InstitucionesProvider {
  String _url = 'slimapi2.v';

  Future<List<Institucion>> getInstituciones() async {
    final url = Uri.https(_url, "api/instituciones");

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return [];
  }

  /* Future<List<Institucion>> _procesarRespUrl(String query) async {} */
}
