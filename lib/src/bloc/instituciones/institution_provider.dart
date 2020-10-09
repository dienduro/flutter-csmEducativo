import 'package:flutter/widgets.dart';
import 'package:flutter_csm_tecnologia/src/services/instituciones_provider.dart';

/* import 'package:provider/provider.dart';
 */
class InstInherited extends InheritedWidget {
  static InstInherited _instancia;

/* hacer que a pensar que yo haga el hotrestar se mantenga esa informacion cuando yo cambie de pantalla y se matenga esa misma informacion */
  factory InstInherited({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new InstInherited._internal(
        key: key,
        child: child,
      );
    }

    return _instancia;
  }
/* patron singleton */
  InstInherited._internal({Key key, Widget child})
      : super(
          key: key,
          child: child,
        );

  final instiProvider = InstitucionesProvider();

  static InstitucionesProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InstInherited>()
        .instiProvider;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
