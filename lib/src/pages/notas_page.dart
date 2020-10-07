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
}
