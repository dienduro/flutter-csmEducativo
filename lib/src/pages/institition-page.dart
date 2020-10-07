import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_csm_tecnologia/src/bloc/instituciones/school_bloc.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_csm_tecnologia/src/search/search_delegate.dart';

import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';

class InstPage extends StatefulWidget {
  static final String routeName = 'institution';
  @override
  _InstPageState createState() => _InstPageState();
}

class _InstPageState extends State<InstPage> {
  final institucionesProvider = new InstitucionesProvider();
  /* final institucionesProvider = new InstitucionesProvider(); */
  /*  School selectedSchool; */
  final schoolBloc = new SchoolBloc();
  InstitucionModel selectedSchool;
  TextEditingController _textController;

  final prefs = new UserPreferences();
  @override
  void initState() {
    _textController = TextEditingController(text: prefs.school);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    /* institucionesProvider.getInstituciones(); */

    /* final _screenSize = MediaQuery.of(context).size; */

    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _crearFondoForm(context),
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

  Widget _crearFondoForm(BuildContext context) {
    /* final searchModalRoute = ModalRoute.of(context).settings.arguments; */

    return Center(
      child: Container(
        width: 330.0,
        height: 220.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: SweepGradient(
            colors: [
              Colors.white10,
              Colors.black26,
              Colors.white30,
              Colors.black12,
              Colors.white10,
            ],
          ),
        ),
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
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              _searchSchool(),
              /* TODO: del textfiel ponerlo o dibujar el texto en su textController
              que me escuche los cambios de la busqueda de la clase DataSearch
               y dibjarlo en el textfield */

              SizedBox(
                height: 10,
              ),
              (_textController != null)
                  ? _botonAcceso(context)
                  : SizedBox(
                      height: 20.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchSchool() {
    /*  String _texto = 'insititucion'; */

    /* TODO: Crear Bloc de Stream para el seach School */

    return StreamBuilder(
      stream: schoolBloc.institucionesStream,
      builder: (context, snapshot) {
        return TextField(
          autofocus: true,
          onChanged: (value) async => await showSearch(
            context: context,
            delegate: DataSearch(),
            query: value,
          ).then((result) async {
            if (result == null) {
              print('no se obtuvieron datos');
            } else {
              prefs.school = result.nombre;
              prefs.idSchool = result.id;
              selectedSchool = result;
              setState(() {});

              print('se econtraron datos$result');
              /* TODO:devolver el resultado en su textEditinController */

              /* _texto = result.nombre; */
            }
          }),
          controller: _textController,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            /*  errorText: snapshot.error, */
            icon: Icon(
              FontAwesomeIcons.school,
              size: 20.0,
              /* color: Colors.white, */
            ),
            filled: true,
            fillColor: Colors.white38,
            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
            labelText: (selectedSchool != null)
                ? selectedSchool.nombre
                : 'Institucion',
            hintStyle: TextStyle(color: Colors.black),
            /* hintText: 'Institución', */
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            /* counterText: snapshot.data, */
            counterStyle: TextStyle(color: Theme.of(context).primaryColorDark),
          ),
        );
      },
    );
  }

  Widget _botonAcceso(BuildContext context) {
    return RaisedButton(
      color: Colors.teal,
      padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 10.0),
      shape: StadiumBorder(),
      elevation: 3.0,
      child: Text(
        'Ingresar',
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () {
        /* TODO: Navegar a la siguiente pantalla llevando la informacion del selectedSchool */
        Navigator.of(context).pushReplacementNamed('login');
        /* Navigator.of(context)
            .pushReplacementNamed('login', arguments: selectedSchool); */
      },
      /* snapshot.hasData ? () => _login(context, bloc) : null */
    );
  }
}
