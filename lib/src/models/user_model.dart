import 'dart:convert';

LoginModel userFromJson(String str) => LoginModel.fromJson(json.decode(str));

String userToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.estado,
    this.success,
    this.codigoMensaje,
    this.mensaje,
    this.datos,
    this.total,
  });

  bool estado;
  bool success;
  int codigoMensaje;
  String mensaje;
  Datos datos;
  int total;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        estado: json["estado"],
        success: json["success"],
        codigoMensaje: json["codigoMensaje"],
        mensaje: json["mensaje"],
        datos: Datos.fromJson(json["datos"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "success": success,
        "codigoMensaje": codigoMensaje,
        "mensaje": mensaje,
        "datos": datos.toJson(),
        "total": total,
      };
}

class Datos {
  Datos({
    this.id,
    this.usuario,
    this.parametros,
    this.seguridad,
    this.escritorio,
  });

  String id;
  Usuario usuario;
  Parametros parametros;
  Seguridad seguridad;
  Escritorio escritorio;

  factory Datos.fromJson(Map<String, dynamic> json) => Datos(
        id: json["id"],
        usuario: Usuario.fromJson(json["usuario"]),
        parametros: Parametros.fromJson(json["parametros"]),
        seguridad: Seguridad.fromJson(json["seguridad"]),
        escritorio: Escritorio.fromJson(json["escritorio"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario.toJson(),
        "parametros": parametros.toJson(),
        "seguridad": seguridad.toJson(),
        "escritorio": escritorio.toJson(),
      };
}

class Escritorio {
  Escritorio({
    this.accesosDirectos,
  });

  List<AccesosDirecto> accesosDirectos;

  factory Escritorio.fromJson(Map<String, dynamic> json) => Escritorio(
        accesosDirectos: List<AccesosDirecto>.from(
            json["accesosDirectos"].map((x) => AccesosDirecto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accesosDirectos":
            List<dynamic>.from(accesosDirectos.map((x) => x.toJson())),
      };
}

class AccesosDirecto {
  AccesosDirecto({
    this.idFormulario,
    this.name,
    this.text,
    this.iconCls,
    this.module,
    this.type,
    this.referencia,
  });

  String idFormulario;
  String name;
  String text;
  IconCls iconCls;
  IconCls module;
  String type;
  IconCls referencia;

  factory AccesosDirecto.fromJson(Map<String, dynamic> json) => AccesosDirecto(
        idFormulario: json["idFormulario"],
        name: json["name"],
        text: json["text"],
        iconCls: iconClsValues.map[json["iconCls"]],
        module: iconClsValues.map[json["module"]],
        type: json["type"],
        referencia: iconClsValues.map[json["referencia"]],
      );

  Map<String, dynamic> toJson() => {
        "idFormulario": idFormulario,
        "name": name,
        "text": text,
        "iconCls": iconClsValues.reverse[iconCls],
        "module": iconClsValues.reverse[module],
        "type": type,
        "referencia": iconClsValues.reverse[referencia],
      };
}

enum IconCls { X_FA_FA_FILE, REGISTRO_NOTAS }

final iconClsValues = EnumValues({
  "registroNotas": IconCls.REGISTRO_NOTAS,
  "x-fa fa-file": IconCls.X_FA_FA_FILE
});

class Parametros {
  Parametros({
    this.manejarActividad,
    this.fechaActividadPlanEvaluacion,
    this.notaComportamiento,
    this.registrarDesempenoComportamiento,
    this.tipoDesempenoComportamiento,
    this.notaComportamientoAcudiente,
    this.registrarDesempenoComportamientoAcudiente,
    this.tipoDesempenoComportamientoAcudiente,
    this.idTerceroRector,
    this.idTerceroCoordinador,
    this.idTerceroSecretaria,
    this.notaMinima,
    this.notaMaxima,
    this.notaMinimaAprobar,
    this.estado,
    this.metodoPuestoEstudiante,
    this.metodoPosicionEstudiante,
    this.formulaPromocionEstudiante,
    this.identificadorUltimoGrado,
    this.cantidadDecimal,
    this.orientacionNotasInfoDesem,
    this.imprimirInfoDesem,
    this.colorCarne,
    this.logosCarne,
    this.idVigencia,
  });

  String manejarActividad;
  String fechaActividadPlanEvaluacion;
  String notaComportamiento;
  dynamic registrarDesempenoComportamiento;
  dynamic tipoDesempenoComportamiento;
  String notaComportamientoAcudiente;
  dynamic registrarDesempenoComportamientoAcudiente;
  dynamic tipoDesempenoComportamientoAcudiente;
  String idTerceroRector;
  String idTerceroCoordinador;
  String idTerceroSecretaria;
  String notaMinima;
  String notaMaxima;
  String notaMinimaAprobar;
  String estado;
  String metodoPuestoEstudiante;
  String metodoPosicionEstudiante;
  dynamic formulaPromocionEstudiante;
  String identificadorUltimoGrado;
  String cantidadDecimal;
  String orientacionNotasInfoDesem;
  String imprimirInfoDesem;
  String colorCarne;
  String logosCarne;
  String idVigencia;

  factory Parametros.fromJson(Map<String, dynamic> json) => Parametros(
        manejarActividad: json["manejarActividad"],
        fechaActividadPlanEvaluacion: json["fechaActividadPlanEvaluacion"],
        notaComportamiento: json["notaComportamiento"],
        registrarDesempenoComportamiento:
            json["registrarDesempenoComportamiento"],
        tipoDesempenoComportamiento: json["tipoDesempenoComportamiento"],
        notaComportamientoAcudiente: json["notaComportamientoAcudiente"],
        registrarDesempenoComportamientoAcudiente:
            json["registrarDesempenoComportamientoAcudiente"],
        tipoDesempenoComportamientoAcudiente:
            json["tipoDesempenoComportamientoAcudiente"],
        idTerceroRector: json["idTerceroRector"],
        idTerceroCoordinador: json["idTerceroCoordinador"],
        idTerceroSecretaria: json["idTerceroSecretaria"],
        notaMinima: json["notaMinima"],
        notaMaxima: json["notaMaxima"],
        notaMinimaAprobar: json["notaMinimaAprobar"],
        estado: json["estado"],
        metodoPuestoEstudiante: json["metodoPuestoEstudiante"],
        metodoPosicionEstudiante: json["metodoPosicionEstudiante"],
        formulaPromocionEstudiante: json["formulaPromocionEstudiante"],
        identificadorUltimoGrado: json["identificadorUltimoGrado"],
        cantidadDecimal: json["cantidadDecimal"],
        orientacionNotasInfoDesem: json["orientacionNotasInfoDesem"],
        imprimirInfoDesem: json["imprimirInfoDesem"],
        colorCarne: json["colorCarne"],
        logosCarne: json["logosCarne"],
        idVigencia: json["idVigencia"],
      );

  Map<String, dynamic> toJson() => {
        "manejarActividad": manejarActividad,
        "fechaActividadPlanEvaluacion": fechaActividadPlanEvaluacion,
        "notaComportamiento": notaComportamiento,
        "registrarDesempenoComportamiento": registrarDesempenoComportamiento,
        "tipoDesempenoComportamiento": tipoDesempenoComportamiento,
        "notaComportamientoAcudiente": notaComportamientoAcudiente,
        "registrarDesempenoComportamientoAcudiente":
            registrarDesempenoComportamientoAcudiente,
        "tipoDesempenoComportamientoAcudiente":
            tipoDesempenoComportamientoAcudiente,
        "idTerceroRector": idTerceroRector,
        "idTerceroCoordinador": idTerceroCoordinador,
        "idTerceroSecretaria": idTerceroSecretaria,
        "notaMinima": notaMinima,
        "notaMaxima": notaMaxima,
        "notaMinimaAprobar": notaMinimaAprobar,
        "estado": estado,
        "metodoPuestoEstudiante": metodoPuestoEstudiante,
        "metodoPosicionEstudiante": metodoPosicionEstudiante,
        "formulaPromocionEstudiante": formulaPromocionEstudiante,
        "identificadorUltimoGrado": identificadorUltimoGrado,
        "cantidadDecimal": cantidadDecimal,
        "orientacionNotasInfoDesem": orientacionNotasInfoDesem,
        "imprimirInfoDesem": imprimirInfoDesem,
        "colorCarne": colorCarne,
        "logosCarne": logosCarne,
        "idVigencia": idVigencia,
      };
}

class Seguridad {
  Seguridad({
    this.expanded,
    this.children,
  });

  bool expanded;
  List<SeguridadChild> children;

  factory Seguridad.fromJson(Map<String, dynamic> json) => Seguridad(
        expanded: json["expanded"],
        children: List<SeguridadChild>.from(
            json["children"].map((x) => SeguridadChild.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "expanded": expanded,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class SeguridadChild {
  SeguridadChild({
    this.id,
    this.text,
    this.idCarpeta,
    this.iconCls,
    this.selectable,
    this.expanded,
    this.children,
  });

  String id;
  String text;
  String idCarpeta;
  String iconCls;
  bool selectable;
  bool expanded;
  List<ChildChild> children;

  factory SeguridadChild.fromJson(Map<String, dynamic> json) => SeguridadChild(
        id: json["id"],
        text: json["text"],
        idCarpeta: json["idCarpeta"],
        iconCls: json["iconCls"],
        selectable: json["selectable"],
        expanded: json["expanded"],
        children: List<ChildChild>.from(
            json["children"].map((x) => ChildChild.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "idCarpeta": idCarpeta,
        "iconCls": iconCls,
        "selectable": selectable,
        "expanded": expanded,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

class ChildChild {
  ChildChild({
    this.idFormulario,
    this.text,
    this.name,
    this.leaf,
    this.type,
    this.referencia,
    this.controlador,
    this.module,
    this.iconCls,
    this.idCarpeta,
  });

  String idFormulario;
  String text;
  String name;
  String leaf;
  String type;
  String referencia;
  String controlador;
  String module;
  IconCls iconCls;
  String idCarpeta;

  factory ChildChild.fromJson(Map<String, dynamic> json) => ChildChild(
        idFormulario: json["idFormulario"],
        text: json["text"],
        name: json["name"],
        leaf: json["leaf"],
        type: json["type"],
        referencia: json["referencia"],
        controlador: json["controlador"],
        module: json["module"],
        iconCls: iconClsValues.map[json["iconCls"]],
        idCarpeta: json["idCarpeta"],
      );

  Map<String, dynamic> toJson() => {
        "idFormulario": idFormulario,
        "text": text,
        "name": name,
        "leaf": leaf,
        "type": type,
        "referencia": referencia,
        "controlador": controlador,
        "module": module,
        "iconCls": iconClsValues.reverse[iconCls],
        "idCarpeta": idCarpeta,
      };
}

class Usuario {
  Usuario({
    this.idUsuario,
    this.codigoUsuario,
    this.clave,
    this.idTercero,
    this.identificacion,
    this.nombreCompleto,
    this.fechaNacimiento,
    this.fotoMovil,
    this.estado,
    this.bloqueado,
    this.intentosFallidos,
    this.idDocente,
    this.idEstudiante,
  });

  String idUsuario;
  String codigoUsuario;
  String clave;
  String idTercero;
  String identificacion;
  String nombreCompleto;
  DateTime fechaNacimiento;
  String fotoMovil;
  String estado;
  String bloqueado;
  String intentosFallidos;
  String idDocente;
  String idEstudiante;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["idUsuario"],
        codigoUsuario: json["CodigoUsuario"],
        clave: json["clave"],
        idTercero: json["idTercero"],
        identificacion: json["identificacion"],
        nombreCompleto: json["nombreCompleto"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        fotoMovil: json["fotoMovil"],
        estado: json["estado"],
        bloqueado: json["bloqueado"],
        intentosFallidos: json["intentosFallidos"],
        idDocente: json["idDocente"],
        idEstudiante: json["idEstudiante"],
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "CodigoUsuario": codigoUsuario,
        "clave": clave,
        "idTercero": idTercero,
        "identificacion": identificacion,
        "nombreCompleto": nombreCompleto,
        "fechaNacimiento":
            "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "fotoMovil": fotoMovil,
        "estado": estado,
        "bloqueado": bloqueado,
        "intentosFallidos": intentosFallidos,
        "idDocente": idDocente,
        "idEstudiante": idEstudiante,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
