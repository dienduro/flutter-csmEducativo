import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';

import 'package:flutter_csm_tecnologia/src/search/search_delegate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstPage extends StatelessWidget {
  final institucionesProvider = new InstitucionesProvider();
  @override
  Widget build(BuildContext context) {
    /* final _screenSize = MediaQuery.of(context).size; */
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _crearTextField(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final _fondoAzul = Container(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/drawable-fhd/prelogin_background.png',
        ),
      ),
    );

    final _whereStudy = SafeArea(
      child: Container(
        width: double.infinity,
        child: Image(
          image: AssetImage(
            'assets/drawable-fhd/where_you_study.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );

    final _institutionImage = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: _screenSize.height * 0.34,
          width: _screenSize.width * 1,
          /*  width: double.infinity,
          height: _screenSize.height * 0.4, */
          child: Image(
              image: AssetImage(
                'assets/drawable-fhd/bkg_institution.png',
              ),
              fit: BoxFit.fill),
        )
      ],
    );

    return Stack(
      children: [
        _fondoAzul,
        Positioned(
          top: _screenSize.height * 0.66,
          child: _institutionImage,
        ),
        _whereStudy,
      ],
    );
  }

  Widget _crearTextField(BuildContext context) {
    final searchModalRoute = ModalRoute.of(context).settings.arguments;
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Institución Educativa',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(),
                );
              },
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                errorText: null,
                /*  errorText: snapshot.error, */
                icon: Icon(
                  FontAwesomeIcons.school,
                  /* color: Colors.white, */
                ),
                filled: true,
                fillColor: Colors.white38,
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                labelText: searchModalRoute,
                hintStyle: TextStyle(color: Colors.black),
                hintText: 'Institucion',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                /* counterText: snapshot.data, */
                counterStyle:
                    TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            (searchModalRoute != null)
                ? RaisedButton(
                    color: Colors.teal,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                    shape: StadiumBorder(),
                    elevation: 3.0,
                    child: Text(
                      'Ingresar',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                    /* snapshot.hasData ? () => _login(context, bloc) : null */
                  )
                : /* RaisedButton(
                    color: Colors.teal,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                    shape: StadiumBorder(),
                    elevation: 3.0,
                    child: Text(
                      'Buscar',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: null,
                    /* snapshot.hasData ? () => _login(context, bloc) : null */
                  ), */
                SizedBox(
                    height: 20.0,
                  ),
          ],
        ),
      ),
    );
  }
}
