import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/* import 'package:flutter_csm_tecnologia/src/bloc/login/login_inherited.dart';
 */
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
import 'package:flutter_csm_tecnologia/src/widget/menu_widget.dart';

class NotasPage extends StatelessWidget {
  static final String routeName = 'notes';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = NotasPage.routeName;
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
          actions: [],
        ),
        key: _scaffoldKey,
        drawer: MenuWidget(),
        body: Stack(
          children: [
            _crearFondo(context),
            _crearDropdowns(context),
            Positioned(
              child: _crearListaAsignaturas(),
            ),
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

  Widget _crearListaAsignaturas() {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      maxChildSize: 0.76,
      minChildSize: 0.1,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: 20,
            controller: scrollController,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white60,
                borderOnForeground: false,
                child: ListTile(
                  onTap: () {
                    Container(
                      child: Text('otra ventana '),
                    );
                  },
                  title: Text('holas'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
