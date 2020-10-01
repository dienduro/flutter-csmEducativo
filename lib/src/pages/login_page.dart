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
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: SizedBox(
                height: 60,
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
          ],
        ),
      ),
    );
  }

  Widget _fondoForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.50,
          width: size.width * 0.75,
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
        Positioned(
          right: 103.0,
          top: 1.0,
          child: Icon(
            Icons.person_pin,
            size: 100.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _contenidoIngreso(BuildContext context) {
    /* final bloc = Provider.of(context); */
    return Column(
      children: [
        SizedBox(
          height: 40.0,
        ),
        _crearEmail(context),
        SizedBox(
          height: 20.0,
        ),
        _crearPassword(context),
        SizedBox(
          height: 30.0,
        ),
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
          counterStyle: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {},
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
          counterStyle: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        keyboardType: TextInputType.visiblePassword,
        onChanged: (value) {},
      ),
    );
  }
}
