import 'dart:convert';

class InstitucionModel {
  List<InstitucionModel> schoolModelFromJson(String str) =>
      List<InstitucionModel>.from(
          json.decode(str).map((x) => InstitucionModel.fromJson(x)));

  String schoolModelToJson(List<InstitucionModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  InstitucionModel({
    this.id = '',
    this.nombre = '',
  });

  String id;
  String nombre;

  factory InstitucionModel.fromJson(Map<String, dynamic> json) =>
      InstitucionModel(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'instance of instituciones:$nombre';
  }
}
