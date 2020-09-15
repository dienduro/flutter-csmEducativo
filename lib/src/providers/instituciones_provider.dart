import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';

class InstitucionesProvider {
  final String _url = '192.168.101.25';

  Future<List<InstitucionModel>> getInstituciones() async {
    final url = Uri.http(_url, "api/instituciones");

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return [];
  }

  /* Future<List<Institucion>> _procesarRespUrl(String query) async {} */
}
