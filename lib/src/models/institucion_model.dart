import 'dart:convert';

InstitucionModel instituteModelFromJson(String str) =>
    InstitucionModel.fromJson(json.decode(str));

String instituteModelToJson(InstitucionModel data) =>
    json.encode(data.toJson());

class Instituciones {
  List<InstitucionModel> items = new List();

  Instituciones();

  Instituciones.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final instituto = new InstitucionModel.fromJson(item);
      items.add(instituto);
    }
  }
}

/* List<Instituciones> institucionesFromJson(String str) =>
    List<Instituciones>.from(
        json.decode(str).map((x) => Instituciones.fromJson(x)));

String institucionesToJson(List<Instituciones> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); */

class InstitucionModel {
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
    // TODO: implement toString
    return 'instance of instituciones:$nombre';
  }
}
