import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';
import 'package:flutter_csm_tecnologia/src/pages/form_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/notas_page.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
import 'package:flutter_csm_tecnologia/src/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuWidget extends StatelessWidget {
  final LoginBloc bloc = new LoginBloc();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

/*     void _openDrawer() => _scaffoldKey.currentState.openDrawer();
 */

    void _closeDrawer() => Navigator.of(context).pop();
    return Drawer(
      elevation: 35.0,
      key: _scaffoldKey,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                imageDrawer(context),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  indent: 15,
                  endIndent: 15.0,
                  color: Colors.blueAccent,
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.eye, color: Colors.blueGrey),
                  title: Text('Valoraciones'),
                  onTap: () {
                    _closeDrawer();
                    Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return NotasPage();
                        },
                      ),
                    );
                    /*  Navigator.of(context).pushReplacementNamed('notes'); */
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.lock, color: Colors.blueGrey),
                  title: Text('Cambiar contraseña'),
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, 'change'),
                ),
                /* ListTile(
                  leading: Icon(Icons.apps, color: Colors.blueGrey),
                  title: Text('People'),
                  onTap: () {},
                ), */
                ListTile(
                  /*  leading: Icon(Icons.close, color: Colors.blueGrey), */
                  title: Text('Cerrar sesion'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    mostrarAlertaUser(context, 'Desea cerrar sesion ?');
                    /* _closeDrawer(); */
                    /* Navigator.pushReplacementNamed(context, 'home'); */
                  },
                ),
                Divider(
                  height: 0.0,
                  indent: 15,
                  endIndent: 15.0,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageDrawer(BuildContext context) {
    void _closeDrawer() => Navigator.of(context).pop();
    final prefs = new UserPreferences();
    return Container(
      height: 200,
      width: 350,
      child: Material(
        color: Colors.cyan[800],
        child: InkWell(
          onTap: () {
            _closeDrawer();
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (BuildContext context) {
                  return FormPage();
                },
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Hero(
                      tag: 'imglogo1',
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.white24, blurRadius: 30.0),
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/drawable-fhd/ic_action_splash2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '${prefs.studentName}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
