class School {
  final String id;
  final String nombre;

  School({
    this.id,
    this.nombre,
  });

  static School fromJson(Map json) => School(
        id: json["id"],
        nombre: json["nombre"],
      );
}
