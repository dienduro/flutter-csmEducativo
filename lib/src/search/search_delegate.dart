import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';
/* import 'package:flutter_csm_tecnologia/src/widget/cargarInstituciones_widget.dart';
 */
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataSearch extends SearchDelegate<InstitucionModel> {
  final institucionesProvider = new InstitucionesProvider();
  InstitucionModel institucionModel = new InstitucionModel();

  /* String seleccion = '';
  final instituciones = [
    'claretiano',
    'santaLibrada',
    'La fragua',
    'la normal',
    'inem',
    'salesiano',
  ];

  final institucionesRecien = [
    'La fragua',
    'la normal',
  ]; */
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text('no se encontraron resultados'));
    }

    return _crearListadoVistas();
  }

  Widget _crearListadoVistas() {
    return FutureBuilder(
      future: institucionesProvider.getInstituciones(),
      builder: (context, AsyncSnapshot<List<InstitucionModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text(
              'No data',
            ),
          );
        }
        final instiList = snapshot.data;
        final result = instiList.where(
          (element) => element.nombre.toLowerCase().contains(
                query.toLowerCase().substring(0, query.length),
              ),
        );

        return _listViewResult(instiList, result);
      },
    );
  }

  Widget _listViewResult(
      List<InstitucionModel> instiList, Iterable<InstitucionModel> result) {
    return ListView.builder(
      itemCount: instiList.length.compareTo(0),
      itemBuilder: (context, index) {
        /* final snackBar = SnackBar(content: Text('sin datos')); */
        final matchResult = result
            .map(
              (e) => _listarResultado(context, e),
            )
            .toList();
        if (matchResult.isEmpty) {
          return Container();
        }

        return matchResult[index];
      },
    );
  }

  Widget _listarResultado(
      BuildContext context, InstitucionModel resultInstitucion) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.school),
      title: Text('${resultInstitucion.nombre}'),
      trailing: Text('${resultInstitucion.id}'),
      onTap: () {
        /* query = institucionModel.nombre; */
        this.close(context, resultInstitucion);
      },
    );
  }
}
