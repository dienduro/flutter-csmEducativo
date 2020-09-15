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
          final institute = snapshot.data;
          return ListView.builder(
            itemCount: institute.length,
            itemBuilder: (context, index) =>
                _crearItem(context, institute[index]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, InstitucionModel instituto) {
    return ListTile(
      title: Text('${instituto.nombre}'),
      subtitle: Text('${instituto.id}'),
      onTap: () {
        Navigator.of(context)
            .popAndPushNamed('institution', arguments: instituto.nombre);
        print(instituto.nombre);
      },
    );
  }
}
