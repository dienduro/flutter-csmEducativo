/* codigo prueba  */
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_csm_tecnologia/src/models/notas_model.dart';
/* import 'package:http/http.dart' as http; */

class NotasProvider {
  /*  List<Dato> datosAsig = new List(); */

  NotasProvider() {
    cargarArea();
  }
  String _url = 'assets/drawable-fhd/notas_json.json';

  List<Calificaciones> _area = new List();
  List<Asignatura> _asignaturas = new List();

  final _areaStreamController =
      StreamController<List<Calificaciones>>.broadcast();

  Function(List<Calificaciones>) get areasAsignaturaSink =>
      _areaStreamController.sink.add;

  Stream<List<Calificaciones>> get areasStream => _areaStreamController.stream;

  void disposeAreaController() {
    _areaStreamController?.close();
  }

  Future<List<Calificaciones>> cargarArea() async {
    try {
      final resp = await rootBundle.loadString(_url);
      final Map<String, dynamic> decodeData = json.decode(resp);
      if (decodeData == null) return [];
      final decoDataF = decodeData['datos'] as List;

      final area =
          decoDataF.map((e) => new Calificaciones.fromJson(e)).toList();
      print(area);

      _area.addAll(area);

      areasAsignaturaSink(_area);

      return area;
      /* final List<Calificaciones> areas = new List(); */
    } catch (e) {
      print(e);
      return [];
    }

    /*  print(decodeData); */

    /* final area = new AreaModel.fromJson(decodeData['datos']); */
    /* print(notas.datos); */

    /* return areas; */
  }

  Future<List<Asignatura>> cargarAsignaturas() async {
    try {
      final resp = await rootBundle.loadString(_url);
      final Map<String, dynamic> decodeData = json.decode(resp);
      if (decodeData == null) return [];
      final decoDataAsignatura = decodeData['datos']['asignaturas'] as List;
      final asignaturas =
          decoDataAsignatura.map((e) => new Asignatura.fromJson(e)).toList();
      print(asignaturas);
      _asignaturas.addAll(asignaturas);

      return asignaturas;
    } catch (e) {
      print(e);
    }

    /* final asignaturasData =
        new Asignaturas.fromJsonList(decodeData['asignaturas']);
    print(asignaturasData.asignaturas[1]);

    return asignaturasData.asignaturas; */
  }
}

/* final notasDataProvider = new _NotasProvider(); */
