import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
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
    final listaSugeridad = (query.isEmpty)
        ? institucionesRecien
        : instituciones
            .where(
              (element) =>
                  element.toLowerCase().startsWith(query.toLowerCase()),
            )
            .toList();
    return ListView.builder(
      itemCount: listaSugeridad.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.autorenew),
          title: Text(listaSugeridad[index]),
          onTap: () {
            Navigator.of(context).popAndPushNamed('institution',
                arguments: query = listaSugeridad[index]);
            print(query);
          },
        );
      },
    );
  }
}
