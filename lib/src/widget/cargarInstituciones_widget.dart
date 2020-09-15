import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';

class CargarInstituciones extends StatelessWidget {
  final institucionesProvider = new InstitucionesProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: institucionesProvider.getInstituciones(),
      builder: (BuildContext context,
          AsyncSnapshot<List<InstitucionModel>> snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
