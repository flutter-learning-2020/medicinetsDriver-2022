class User {
  User({
    required this.codigo,
    required this.fechaHora,
    required this.mensaje,
    required this.data,
  });

  int codigo;
  DateTime fechaHora;
  String mensaje;
  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        codigo: json["Codigo"],
        fechaHora: DateTime.parse(json["FechaHora"]),
        mensaje: json["Mensaje"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Codigo": codigo,
        "FechaHora": fechaHora.toIso8601String(),
        "Mensaje": mensaje,
        "Data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.nroCarnet,
    required this.celular,
    required this.imagenPerfil,
    required this.email,
    required this.idCiudad,
    required this.nombreCiudad,
    required this.habilitado,
    required this.activado,
  });

  String id;
  String nombre;
  String apellido;
  String nroCarnet;
  String celular;
  String imagenPerfil;
  String email;
  String idCiudad;
  String nombreCiudad;
  String habilitado;
  String activado;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        nroCarnet: json["nro_carnet"],
        celular: json["celular"],
        imagenPerfil: json["imagen_perfil"],
        email: json["email"],
        idCiudad: json["id_ciudad"],
        nombreCiudad: json["nombre_ciudad"],
        habilitado: json["habilitado"],
        activado: json["activado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "nro_carnet": nroCarnet,
        "celular": celular,
        "imagen_perfil": imagenPerfil,
        "email": email,
        "id_ciudad": idCiudad,
        "nombre_ciudad": nombreCiudad,
        "habilitado": habilitado,
        "activado": activado,
      };
}
