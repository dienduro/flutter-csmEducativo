import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_inherited.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setPreferredOrientations(DeviceOrientation.values); */
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
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
              image: AssetImage('assets/drawable-fhd/login_background.png'),
            ),
          ),
        )
      ],
    );

    return Stack(
      children: <Widget>[
        _imgFondo,
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _fondoForm(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Olvidó su contraseña',
                      style: TextStyle(color: Colors.white54),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fondoForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: orientation == Orientation.portrait
                ? size.height * 0.5
                : size.height * 0.8,
            width: size.width * 0.78,
            margin: EdgeInsets.symmetric(vertical: 50.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(23, 43, 32, 0.6),
                  Color.fromRGBO(35, 123, 64, 0.6),
                ],
              ),
              color: Color.fromRGBO(255, 255, 255, 0.8),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[],
            ),
            child: _contenidoIngreso(context),
          ),
        ),
        Positioned(
          right: orientation == Orientation.portrait
              ? size.width * 0.27
              : size.width * 0.32,
          top: 1.0,
          child: Icon(
            Icons.person_pin,
            size: 100.0,
            color: Color.fromARGB(220, 200, 200, 200),
          ),
        ),
      ],
    );
  }

  Widget _contenidoIngreso(BuildContext context) {
    /* instanciar el Provider de tipo loginbloc */
    final bloc = LoginInherited.of(context);
    return Column(
      children: [
        SizedBox(
          height: 40.0,
        ),
        _crearUsuario(bloc),
        SizedBox(
          height: 20.0,
        ),
        _crearPassword(bloc),
        SizedBox(
          height: 20.0,
        ),
        _crearboton(bloc),
      ],
    );
  }

/* recordar exportar las propiedades en login_provider par que me pueda leer en la instancia */
  Widget _crearUsuario(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white24,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.white,
              ),
              filled: true,
              fillColor: Colors.black12,
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Username:',
              hintStyle: TextStyle(color: Colors.white),
              errorText: snapshot.error,
              hintText: 'nombre de usuario',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              counterStyle:
                  TextStyle(color: Theme.of(context).primaryColorLight),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.changeUser,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    /* implementar el StremBuilder en donde voy escuchar y dibujar lo que tengo del textfield */

    return StreamBuilder(
      stream: bloc.paswordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white24,
            decoration: InputDecoration(
              /* errorText: snapshot.error, */
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              filled: true,
              fillColor: Colors.black12,
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Password:',
              hintStyle: TextStyle(color: Colors.white),
              errorText: snapshot.error,
              /* counterText: snapshot.data, */
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              counterStyle:
                  TextStyle(color: Theme.of(context).primaryColorLight),
            ),
            keyboardType: TextInputType.visiblePassword,
            onChanged: bloc.changePass,
          ),
        );
      },
    );
  }

  Widget _crearboton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.loginValidStreamRx,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(40, 90, 175, 120),
                  Color.fromARGB(120, 47, 188, 145),
                ])),
            child: (snapshot.hasData)
                ? FlatButton(
                    /*  color: Colors.white54, */
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                    shape: StadiumBorder(),
                    child: Text(
                      'Ingresar',
                      style: TextStyle(fontSize: 20.0, color: Colors.white60),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        'notes',
                      );
                    },
                  )
                : Container());
      },
    );
  }
}
