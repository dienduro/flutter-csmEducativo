import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    final size = MediaQuery.of(context).size;

    final fondoRotate = Transform.rotate(
      angle: -pi / -20.0,
      child: Container(
        height: 60.0,
        width: 240.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(63, 63, 156, 1.0),
              Color.fromRGBO(90, 70, 200, 1.0),
            ],
          ),
        ),
      ),
    );

    /* final fondoGradient = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 200, 1.0),
          ],
        ),
      ),
    ); */

    final circulo = Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white12,
      ),
    );

    return Stack(
      children: <Widget>[
        /* fondoGradient, */
        Positioned(
          right: -100.0,
          top: -140.0,
          height: 340,
          width: 520,
          child: fondoRotate,
        ),
        Positioned(
          right: 100.0,
          height: 30.0,
          bottom: 120.0,
          child: circulo,
        ),
        Positioned(
          right: 200.0,
          height: 30.0,
          bottom: 60.0,
          child: circulo,
        ),
        Positioned(
          left: -100.0,
          bottom: -10.0,
          height: 30.0,
          child: circulo,
        ),
        Positioned(
          right: -10.0,
          top: 100.0,
          height: 30.0,
          child: circulo,
        ),
        Positioned(
          right: -40.0,
          top: 40.0,
          height: 30.0,
          child: circulo,
        ),
        Positioned(
          right: -90.0,
          top: 200.0,
          height: 30.0,
          child: circulo,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Icon(
              Icons.person_pin,
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
            ),
            Text(
              'Bienvenido',
              style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
            SizedBox(
              height: 100.0,
              width: double.infinity,
            ),
          ],
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: SizedBox(
                height: 150,
              ),
            ),
            _fondoForm(context),
            Row(
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'registro');
                  },
                  child: Text(
                    'crear una nueva cuenta',
                    overflow: TextOverflow.clip,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Olvido su coontraseña',
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            /* SizedBox(
              height: 100.0,
            ), */
          ],
        ),
      ),
    );
  }

  Widget _fondoForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.symmetric(vertical: 50.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(100, 10, 160, 0.6),
            Color.fromRGBO(50, 20, 170, 0.6),
          ],
        ),
        color: Color.fromRGBO(255, 255, 255, 0.8),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(-15.0, -20.0),
            spreadRadius: 3.0,
          ),
          BoxShadow(
            color: Colors.black45,
            blurRadius: 20.0,
            offset: Offset(0.0, 3.0),
            spreadRadius: 3.0,
          ),
        ],
      ),
      child: _contenidoIngreso(context),
    );
  }

  Widget _contenidoIngreso(BuildContext context) {
    /* final bloc = Provider.of(context); */
    return Column(
      children: [
        Text(
          'Ingreso',
          style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        _crearEmail(context),
        /* _crearEmail(bloc), */

        SizedBox(
          height: 50.0,
        ),
        /* _crearPassword(bloc), */
        _crearPassword(context),
        SizedBox(
          height: 30.0,
        ),
        /* _crearBoton(bloc), */
        RaisedButton(
          color: Colors.white54,
          padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
          shape: StadiumBorder(),
          elevation: 40.0,
          child: Text(
            'Ingresar',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _crearEmail(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white24,
        decoration: InputDecoration(
          /*   errorText: snapshot.error ,*/
          icon: Icon(
            Icons.alternate_email,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black12,
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Email:',
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'example@email.com',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          /*  counterText: snapshot.data, */
          counterStyle: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {},
        /* (value) => bloc.changeEmail(value), */
      ),
    );
  }

  Widget _crearPassword(BuildContext context) {
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          /*  counterText: snapshot.data, */
          counterStyle: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        keyboardType: TextInputType.visiblePassword,
        /* onChanged: (value) => bloc.changePassword(value), */

        onChanged: (value) {},
      ),
    );
  }
}
