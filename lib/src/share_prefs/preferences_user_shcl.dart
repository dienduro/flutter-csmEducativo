import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _preferences;

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /* int _idSchool;
  String _school; */

  get idSchool {
    return _preferences.getString('idSchool') ?? '';
  }

  get school {
    return _preferences.getString('name') ?? '';
  }

  set idSchool(String id) {
    _preferences.setString('idSchool', id);
  }

  set school(String name) {
    _preferences.setString('name', name);
  }
}
