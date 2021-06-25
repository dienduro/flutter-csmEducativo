// To parse this JSON data, do
//
//     final calificaciones = calificacionesFromJson(jsonString);

import 'dart:convert';

Calificaciones calificacionesFromJson(String str) =>
    Calificaciones.fromJson(json.decode(str));

String calificacionesToJson(Calificaciones data) => json.encode(data.toJson());

class Calificaciones {
  Calificaciones({
    this.estado,
    this.success,
    this.codigoMensaje,
    this.mensaje,
    this.datos,
    this.total,
  });

  bool estado;
  bool success;
  int codigoMensaje;
  String mensaje;
  List<Dato> datos;
  int total;

  factory Calificaciones.fromJson(Map<String, dynamic> json) => Calificaciones(
        estado: json["estado"],
        success: json["success"],
        codigoMensaje: json["codigoMensaje"],
        mensaje: json["mensaje"],
        datos: List<Dato>.from(json["datos"].map((x) => Dato.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "success": success,
        "codigoMensaje": codigoMensaje,
        "mensaje": mensaje,
        "datos": List<dynamic>.from(datos.map((x) => x.toJson())),
        "total": total,
      };
}

class Dato {
  Dato({
    this.id,
    this.codigo,
    this.nombre,
    this.periodos,
    this.asignaturas,
  });

  String id;
  String codigo;
  String nombre;
  List<DatoPeriodo> periodos;
  List<Asignatura> asignaturas;

  factory Dato.fromJson(Map<String, dynamic> json) => Dato(
        id: json["id"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        periodos: List<DatoPeriodo>.from(
            json["periodos"].map((x) => DatoPeriodo.fromJson(x))),
        asignaturas: List<Asignatura>.from(
            json["asignaturas"].map((x) => Asignatura.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "nombre": nombre,
        "periodos": List<dynamic>.from(periodos.map((x) => x.toJson())),
        "asignaturas": List<dynamic>.from(asignaturas.map((x) => x.toJson())),
      };
}

class Asignatura {
  Asignatura({
    this.idArea,
    this.id,
    this.codigo,
    this.nombre,
    this.tipoNota,
    this.periodos,
  });

  String idArea;
  String id;
  String codigo;
  String nombre;
  String tipoNota;
  List<AsignaturaPeriodo> periodos;

  factory Asignatura.fromJson(Map<String, dynamic> json) => Asignatura(
        idArea: json["idArea"],
        id: json["id"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        tipoNota: json["tipoNota"],
        periodos: List<AsignaturaPeriodo>.from(
            json["periodos"].map((x) => AsignaturaPeriodo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idArea": idArea,
        "id": id,
        "codigo": codigo,
        "nombre": nombre,
        "tipoNota": tipoNota,
        "periodos": List<dynamic>.from(periodos.map((x) => x.toJson())),
      };
}

class AsignaturaPeriodo {
  AsignaturaPeriodo({
    this.id,
    this.nombre,
    this.idAsignatura,
    this.definitivo,
    this.nota,
  });

  String id;
  Nombre nombre;
  String idAsignatura;
  int definitivo;
  String nota;

  factory AsignaturaPeriodo.fromJson(Map<String, dynamic> json) =>
      AsignaturaPeriodo(
        id: json["id"] == null ? null : json["id"],
        nombre: nombreValues.map[json["nombre"]],
        idAsignatura: json["idAsignatura"],
        definitivo: json["definitivo"],
        nota: json["nota"] == null ? null : json["nota"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombreValues.reverse[nombre],
        "idAsignatura": idAsignatura,
        "definitivo": definitivo,
        "nota": nota == null ? null : nota,
      };
}

enum Nombre { I, II, III, IV, DF }

final nombreValues = EnumValues({
  "DF": Nombre.DF,
  "I": Nombre.I,
  "II": Nombre.II,
  "III": Nombre.III,
  "IV": Nombre.IV
});

class DatoPeriodo {
  DatoPeriodo({
    this.idArea,
    this.idPeriodo,
    this.nombrePeriodo,
    this.nota,
  });

  String idArea;
  String idPeriodo;
  Nombre nombrePeriodo;
  String nota;

  factory DatoPeriodo.fromJson(Map<String, dynamic> json) => DatoPeriodo(
        idArea: json["idArea"],
        idPeriodo: json["idPeriodo"],
        nombrePeriodo: nombreValues.map[json["nombrePeriodo"]],
        nota: json["nota"],
      );

  Map<String, dynamic> toJson() => {
        "idArea": idArea,
        "idPeriodo": idPeriodo,
        "nombrePeriodo": nombreValues.reverse[nombrePeriodo],
        "nota": nota,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
