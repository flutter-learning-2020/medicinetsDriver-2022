class DriverActiveModel {
  DriverActiveModel({
    required this.codigo,
    required this.fechaHora,
    required this.mensaje,
    required this.data,
  });

  int codigo;
  DateTime fechaHora;
  String mensaje;
  String data;

  factory DriverActiveModel.fromJson(Map<String, dynamic> json) =>
      DriverActiveModel(
        codigo: json["Codigo"],
        fechaHora: DateTime.parse(json["FechaHora"]),
        mensaje: json["Mensaje"],
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "Codigo": codigo,
        "FechaHora": fechaHora.toIso8601String(),
        "Mensaje": mensaje,
        "Data": data,
      };
}
