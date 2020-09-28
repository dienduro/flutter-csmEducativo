import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/services/instititucion_service.dart';
import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';
/* import 'package:flutter_csm_tecnologia/src/widget/cargarInstituciones_widget.dart';
 */
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataSearch extends SearchDelegate<InstitucionModel> {
  final institucionesProvider = new InstitucionesProvider();

  /* InstitucionModel institucionModel = new InstitucionModel(); */

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
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final schoolService = new InstituteServices();
    // TODO: implement buildResults
    return FutureBuilder(
      future: schoolService.getSchoolByName(query),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          //crar la lista

        } else {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext contex) {
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
        final instiList = snapshot.data;
        final result = instiList.where(
          (element) => element.nombre.toLowerCase().contains(
                query.toLowerCase().substring(0, query.length),
              ),
        );

        /* print(query = result.toString()); */

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

            /* print(matchResult[index]); */
            return matchResult[index];
          },
        );

        /* ListView(
          children: result
              .map<ListTile>((e) => ListTile(
                    leading: Icon(FontAwesomeIcons.school),
                    title: Text(e.nombre),
                    subtitle: Text(e.id),
                    onTap: () {
                      prin
                      Navigator.of(context).popAndPushNamed('institution',
                          result: e.id, arguments: e.id);
                    },
                  ))
              .toList(),
        ); */
      },
    );

    /* CargarInstituciones() */
  }

  Widget _listarResultado(
      BuildContext context, InstitucionModel resultInstitucion) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.school),
      title: Text('${resultInstitucion.nombre}'),
      trailing: Text('${resultInstitucion.id}'),
      onTap: () {
        query = resultInstitucion.nombre;
        /* print(resultInstitucion); */
        /* Navigator.of(context).popAndPushNamed('institution', arguments: query); */
        /* this.close(context, resultInstitucion); */
        return resultInstitucion;
      },
    );
  }
}

class Data {}
