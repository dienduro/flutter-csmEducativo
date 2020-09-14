import 'dart:convert';

List<Instituciones> institucionesFromJson(String str) =>
    List<Instituciones>.from(
        json.decode(str).map((x) => Instituciones.fromJson(x)));

String institucionesToJson(List<Instituciones> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Instituciones {
  Instituciones({
    this.id,
    this.nombre,
  });

  String id;
  String nombre;

  factory Instituciones.fromJson(Map<String, dynamic> json) => Instituciones(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
