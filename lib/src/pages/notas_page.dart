import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_inherited.dart';

class NotasPage extends StatelessWidget {
  static final String routeName = 'notes';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    final bloc = LoginInherited.of(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('tus notas: ${bloc.lastUser}'),
          actions: [],
        ),
        body: Stack(
          children: [
            _crearFondo(context),
            _crearDropdowns(),
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

  Widget _crearDropdowns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _dropdownAno(),
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
          onChanged: (value) {},
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
          onChanged: (value) {},
        ),
      ),
    );
  }
}
