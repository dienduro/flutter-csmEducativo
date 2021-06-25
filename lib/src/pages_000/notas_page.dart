import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/* import 'package:flutter_csm_tecnologia/src/models/notes.model.dart'; */

import 'package:flutter_csm_tecnologia/src/provider/notas_provider.dart';
import 'package:flutter_csm_tecnologia/src/services/notes_services.dart';

import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
import 'package:flutter_csm_tecnologia/src/widget/menu_widget.dart';
import 'package:flutter_csm_tecnologia/src/widget/tarjetas_table_asignatura.dart';
import 'package:provider/provider.dart';

class NotasPage extends StatefulWidget {
  static final String routeName = 'notes';

  @override
  _NotasPageState createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final prefs = new UserPreferences();
  final asignaturaProvider = new NotasProvider();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = NotasPage.routeName;

    asignaturaProvider.cargarArea();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    /* final bloc = LoginInherited.of(context); */
    return Scaffold(
        appBar: AppBar(
          title: Text('CSM Educativo'),
        ),
        key: _scaffoldKey,
        drawer: MenuWidget(),
        body: Stack(
          children: [
            _crearFondo(context),
            _crearDropdowns(context),
            _crearListaAsignaturas(),
          ],
        ));
  }

  Widget _crearFondo(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _imgFondo = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            height: _size.height * 1,
            width: _size.width * 1,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/drawable-fhd/background_note_list.jpg'),
            ),
          ),
        )
      ],
    );

    final _logoCsm = Container(
      child: Image(
        image: AssetImage('assets/drawable-fhd/csm_note_logo.png'),
      ),
    );

    return Stack(
      children: <Widget>[
        _imgFondo,
        Positioned(
          height: 120.0,
          right: -5.0,
          child: _logoCsm,
        ),
      ],
    );
  }

  Widget _crearDropdowns(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _size.height * 0.02,
        ),
        _dropdownAno(),
        SizedBox(
          height: _size.height * 0.01,
        ),
        _dropdownAsignatura(),
      ],
    );
  }

  Widget _dropdownAno() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        height: 50,
        width: 160,
        padding: EdgeInsets.only(left: 6, right: 2, top: 14),
        decoration:
            BoxDecoration(color: Colors.green[700], shape: BoxShape.rectangle),
        child: DropdownButton(
          isDense: true,
          dropdownColor: Colors.green[700],
          isExpanded: true,
          iconEnabledColor: Colors.white,
          style: TextStyle(color: Colors.white, fontSize: 18),
          items: [
            DropdownMenuItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '2020',
                ),
              ],
            ))
          ],
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }

  Widget _dropdownAsignatura() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Container(
        height: 50,
        width: 250,
        padding: EdgeInsets.only(left: 6, right: 2, top: 14),
        decoration:
            BoxDecoration(color: Colors.green[700], shape: BoxShape.rectangle),
        child: DropdownButton(
          isDense: true,
          dropdownColor: Colors.green[700],
          isExpanded: true,
          iconEnabledColor: Colors.white,
          style: TextStyle(color: Colors.white, fontSize: 18),
          items: [
            DropdownMenuItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Todos',
                ),
              ],
            ))
          ],
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }

  Widget _crearListaAsignaturas() {
    /* final dataNotasProvider = new NotasProvider(); */
    final noteServices = Provider.of<NoteServices>(context);
    print(noteServices);

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.76,
      minChildSize: 0.2,
      expand: true,
      builder: (context, scrollController) {
        return CardListTable(
          dato: noteServices.datos,
          controller: scrollController,
        );
        /*  return StreamBuilder(
            stream: dataNotasProvider.areasStream,
            builder: (context, AsyncSnapshot<List<Calificaciones>> snapshot) {
              if (snapshot.hasData) {
                return CardListTable(
                  controller: scrollController,
                  areas: snapshot.data,
                );
              }
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }); */
      },
    );
  }

  /* Widget listaAreas() {
    /* TODO: motrar cuadro de las notas del json */
    return Card(
      color: Colors.white60,
      borderOnForeground: false,
      child: ExpansionTile(
        title: Text(
          '',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: [],
      ),
    );
  } */
}

/* Column(
            children: [
              Container(
                /*   decoration: BoxDecoration(color: Colors.amberAccent), */
                child: Column(
                  children: [
                    Text('Asignatura'),
                    DataTable(
                      columnSpacing: 15.0,
                      columns: [
                        DataColumn(label: Text('I')),
                        DataColumn(label: Text('II')),
                        DataColumn(label: Text('III')),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(
                              Text('2.2'),
                              onTap: () {
                                print('selecciono periodo 1');
                              },
                            ),
                            DataCell(
                              SizedBox(width: 30.0, child: Text('3.3')),
                              onTap: () {},
                            ),
                            DataCell(
                              Text('4'),
                              onTap: () {},
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('prom')),
                            DataCell(Text('')),
                            DataCell(Text('4')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Column(
                  children: [
                    Text('Asignatura'),
                    DataTable(
                      columnSpacing: 15.0,
                      columns: [
                        DataColumn(label: Text('I')),
                        DataColumn(label: Text('II')),
                        DataColumn(label: Text('III')),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(
                              Text('2.2'),
                              onTap: () {
                                print('selecciono periodo 1');
                              },
                            ),
                            DataCell(
                              SizedBox(width: 30.0, child: Text('3.3')),
                              onTap: () {},
                            ),
                            DataCell(
                              Text('4'),
                              onTap: () {},
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('prom')),
                            DataCell(Text('')),
                            DataCell(Text('4')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ), */
