import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';
import 'package:rxdart/subjects.dart';

class SchoolBloc with InstitucionesProvider {
  final _institucionesController = BehaviorSubject<InstitucionModel>();

  Stream<InstitucionModel> get institucionesStream =>
      _institucionesController.stream;

  Function(InstitucionModel) get instanciaInsti =>
      _institucionesController.sink.add;

  dispose() {
    _institucionesController?.close();
  }
}
