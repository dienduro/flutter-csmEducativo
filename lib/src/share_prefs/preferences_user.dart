import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }
  UserPreferences._internal();

  SharedPreferences _prefs;

/* inicializo la prefrecia con initPrefs */

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get school {
    return _prefs.getString('school') ?? '';
  }

  set school(String value) {
    _prefs.setString('school', value);
  }

  get idSchool {
    return _prefs.getString('idSchool') ?? '';
  }

  set idSchool(String id) {
    _prefs.setString('idSchool', id);
  }

  get idUser {
    return _prefs.getString('idUser') ?? '';
  }

  set idUser(String value) {
    _prefs.setString('idUser', value);
  }

  /* get passwordUser {
    return _prefs.getString('pwdUsr') ?? '';
  }

  set passwordUser(String value) {
    _prefs.setString('pwdUsr', value);
  } */

  get userName {
    return _prefs.getString('userName') ?? '';
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

  get studentName {
    return _prefs.getString('student') ?? '';
  }

  set studentName(String value) {
    _prefs.setString('student', value);
  }

  get idStudiante {
    return _prefs.getString('idStudent') ?? '';
  }

  set idStudiante(String value) {
    _prefs.setString('idStudent', value);
  }

  get fechaNacimiento {
    return _prefs.getString('birthday') ?? '';
  }

  set fechaNacimiento(String value) {
    _prefs.setString('birthday', value);
  }

  get identificacion {
    return _prefs.getString('identify') ?? '';
  }

  set identificacion(String value) {
    _prefs.setString('identify', value);
  }

  get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
