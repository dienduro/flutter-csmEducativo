/* import 'dart:convert'; */

class Datos {
  List<Dato> datos = new List();
  Datos();
  Datos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final dato = new Dato.fromJson(item);
      datos.add(dato);
    }
  }
}

class Asignaturas {
  List<Asignatura> asignaturas = new List();
  Asignaturas();
  Asignaturas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final asignatura = new Asignatura.fromJson(item);
      asignaturas.add(asignatura);
    }
  }
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
  @override
  String toString() {
    return 'instance of instituciones:$nombre';
  }
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
  @override
  String toString() {
    return 'instance of instituciones:$nombre';
  }
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
  String nombre;
  String idAsignatura;
  int definitivo;
  String nota;

  factory AsignaturaPeriodo.fromJson(Map<String, dynamic> json) =>
      AsignaturaPeriodo(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"],
        idAsignatura: json["idAsignatura"],
        definitivo: json["definitivo"],
        nota: json["nota"] == null ? null : json["nota"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre,
        "idAsignatura": idAsignatura,
        "definitivo": definitivo,
        "nota": nota == null ? null : nota,
      };
  @override
  String toString() {
    return 'instance of instituciones:$nombre';
  }
}

/* enum Nombre { I, II, III, IV, DF }

final nombreValues = EnumValues({
  "DF": Nombre.DF,
  "I": Nombre.I,
  "II": Nombre.II,
  "III": Nombre.III,
  "IV": Nombre.IV
}); */

class DatoPeriodo {
  DatoPeriodo({
    this.idArea,
    this.idPeriodo,
    this.nombrePeriodo,
    this.nota,
  });

  String idArea;
  String idPeriodo;
  String nombrePeriodo;
  String nota;

  factory DatoPeriodo.fromJson(Map<String, dynamic> json) => DatoPeriodo(
        idArea: json["idArea"],
        idPeriodo: json["idPeriodo"],
        nombrePeriodo: json["nombrePeriodo"],
        nota: json["nota"],
      );

  Map<String, dynamic> toJson() => {
        "idArea": idArea,
        "idPeriodo": idPeriodo,
        "nombrePeriodo": nombrePeriodo,
        "nota": nota,
      };
  @override
  String toString() {
    return 'instance of instituciones:$nombrePeriodo';
  }
}

/* class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
} */
