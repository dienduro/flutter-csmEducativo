import 'dart:convert';

class Instituciones {
  List<Institucion> items = new List();

  Instituciones();

  Instituciones.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final instituto = new Institucion.fromJson(item);
      items.add(instituto);
    }
  }
}

/* List<Instituciones> institucionesFromJson(String str) =>
    List<Instituciones>.from(
        json.decode(str).map((x) => Instituciones.fromJson(x)));

String institucionesToJson(List<Instituciones> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); */

class Institucion {
  Institucion({
    this.id,
    this.nombre,
  });

  String id;
  String nombre;

  factory Institucion.fromJson(Map<String, dynamic> json) => Institucion(
        id: json["id"].cast<int>(),
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
