import 'dart:convert';

List<SchoolModel> schoolModelFromJson(String str) => List<SchoolModel>.from(
    json.decode(str).map((x) => SchoolModel.fromJson(x)));

String schoolModelToJson(List<SchoolModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolModel {
  SchoolModel({
    this.id,
    this.nombre,
  });

  String id;
  String nombre;

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
