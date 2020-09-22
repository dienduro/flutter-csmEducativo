import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';
/* import 'package:flutter_csm_tecnologia/src/widget/cargarInstituciones_widget.dart';
 */
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataSearch extends SearchDelegate {
  final institucionesProvider = new InstitucionesProvider();
  String seleccion = '';
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
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
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
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    /* final listaSugeridad = (query.isEmpty)
        ? institucionesRecien
        : instituciones
            .where(
              (element) =>
                  element.toLowerCase().startsWith(query.toLowerCase()),
            )
            .toList(); */

    if (query.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
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
        final result = snapshot.data.where(
          (element) => element.nombre.toLowerCase().contains(
                query.toLowerCase().substring(0, query.length),
              ),
        );

        final selectedInst = List;

        /* print(query = result.toString()); */

        return ListView(
          children: result
              .map<ListTile>((e) => ListTile(
                    leading: Icon(FontAwesomeIcons.school),
                    title: Text(e.nombre),
                    subtitle: Text(e.id),
                    onTap: () {
                      Navigator.of(context).popAndPushNamed('institution',
                          result: e.id, arguments: e.nombre);
                    },
                  ))
              .toList(),
        );
      },
    );

    /* CargarInstituciones() */
  }
}
