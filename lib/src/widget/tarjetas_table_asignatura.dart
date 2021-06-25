import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/models/notas_model.dart';

class CardListTable extends StatelessWidget {
  final List<Dato> dato;
  final List<Asignatura> asignatura;
  final List<DatoPeriodo> periodoDato;
  final List<AsignaturaPeriodo> periodoAsignatura;

  final ScrollController controller;

  CardListTable(
      {this.dato,
      this.controller,
      this.asignatura,
      this.periodoAsignatura,
      this.periodoDato});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dato.length,
      controller: controller,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white60,
          borderOnForeground: false,
          child: ExpansionTile(
            title: Text(dato[index].nombre),
            children: [
              Container(
                height: 200,
                width: 200,
                child: PageView.builder(
                  key: ObjectKey(dato[index].id),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Text(dato[index].id);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  /* Widget listaAreas(BuildContext ctx) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: dato.length,
        itemBuilder: (BuildContext context, int index) {
          return 
        },
      ),
    );
  } */
}
