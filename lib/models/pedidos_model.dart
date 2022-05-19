import 'package:medicinetsdriver/models/solicitudes_model.dart';

class PedidosModel {
  PedidosModel({
    required this.codigo,
    required this.fechaHora,
    required this.mensaje,
    required this.data,
  });

  int codigo;
  DateTime fechaHora;
  String mensaje;
  Data data;

  factory PedidosModel.fromJson(Map<String, dynamic> json) => PedidosModel(
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
    required this.totalPaginas,
    required this.porPagina,
    required this.paginaActual,
    required this.listado,
  });

  int totalPaginas;
  int porPagina;
  int paginaActual;
  List<Datum> listado;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalPaginas: json["totalPaginas"],
        porPagina: json["porPagina"],
        paginaActual: json["paginaActual"],
        listado:
            List<Datum>.from(json["listado"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPaginas": totalPaginas,
        "porPagina": porPagina,
        "paginaActual": paginaActual,
        "listado": List<dynamic>.from(listado.map((x) => x.toJson())),
      };
}

class Listado {
  Listado({
    required this.id,
    required this.fecha,
    required this.hora,
    required this.totalNeto,
    required this.totalEnvio,
    required this.totalPedido,
    required this.totalComisionPorVenta,
    required this.totalComisionPorPagoOnline,
    required this.nit,
    required this.razonSocial,
    required this.latitud,
    required this.longitud,
    required this.nombreDireccion,
    required this.referenciaDireccion,
    required this.direccion,
    required this.eliminado,
    required this.pagado,
    required this.idMpTipoPago,
    required this.idCliente,
    required this.idMpEstadoPedido,
    required this.idMpComercio,
    required this.idMpPagoOnline,
    required this.idMpTipoEnvio,
    required this.motivoEstado,
    required this.esProforma,
    required this.codigoPedido,
    required this.idMpTipoDescuento,
    required this.totalDescuento,
    required this.idComercio,
    required this.nombreComercio,
    required this.direccionComercio,
    required this.celularComercio,
    required this.latitudComercio,
    required this.longitudComercio,
  });

  String id;
  DateTime fecha;
  String hora;
  String totalNeto;
  String totalEnvio;
  String totalPedido;
  String totalComisionPorVenta;
  String totalComisionPorPagoOnline;
  String nit;
  String razonSocial;
  String latitud;
  String longitud;
  String nombreDireccion;
  String referenciaDireccion;
  String direccion;
  String eliminado;
  String pagado;
  String idMpTipoPago;
  String idCliente;
  String idMpEstadoPedido;
  String idMpComercio;
  dynamic idMpPagoOnline;
  String idMpTipoEnvio;
  dynamic motivoEstado;
  String esProforma;
  String codigoPedido;
  String idMpTipoDescuento;
  String totalDescuento;
  String idComercio;
  String nombreComercio;
  String direccionComercio;
  String celularComercio;
  String latitudComercio;
  String longitudComercio;

  factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        hora: json["hora"],
        totalNeto: json["total_neto"],
        totalEnvio: json["total_envio"],
        totalPedido: json["total_pedido"],
        totalComisionPorVenta: json["total_comision_por_venta"],
        totalComisionPorPagoOnline: json["total_comision_por_pago_online"],
        nit: json["nit"],
        razonSocial: json["razon_social"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        nombreDireccion: json["nombre_direccion"],
        referenciaDireccion: json["referencia_direccion"],
        direccion: json["direccion"],
        eliminado: json["eliminado"],
        pagado: json["pagado"],
        idMpTipoPago: json["id_mp_tipo_pago"],
        idCliente: json["id_cliente"],
        idMpEstadoPedido: json["id_mp_estado_pedido"],
        idMpComercio: json["id_mp_comercio"],
        idMpPagoOnline: json["id_mp_pago_online"],
        idMpTipoEnvio: json["id_mp_tipo_envio"],
        motivoEstado: json["motivo_estado"],
        esProforma: json["es_proforma"],
        codigoPedido: json["codigo_pedido"],
        idMpTipoDescuento: json["id_mp_tipo_descuento"],
        totalDescuento: json["total_descuento"],
        idComercio: json["id_comercio"],
        nombreComercio: json["nombre_comercio"],
        direccionComercio: json["direccion_comercio"],
        celularComercio: json["celular_comercio"],
        latitudComercio: json["latitud_comercio"],
        longitudComercio: json["longitud_comercio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "hora": hora,
        "total_neto": totalNeto,
        "total_envio": totalEnvio,
        "total_pedido": totalPedido,
        "total_comision_por_venta": totalComisionPorVenta,
        "total_comision_por_pago_online": totalComisionPorPagoOnline,
        "nit": nit,
        "razon_social": razonSocial,
        "latitud": latitud,
        "longitud": longitud,
        "nombre_direccion": nombreDireccion,
        "referencia_direccion": referenciaDireccion,
        "direccion": direccion,
        "eliminado": eliminado,
        "pagado": pagado,
        "id_mp_tipo_pago": idMpTipoPago,
        "id_cliente": idCliente,
        "id_mp_estado_pedido": idMpEstadoPedido,
        "id_mp_comercio": idMpComercio,
        "id_mp_pago_online": idMpPagoOnline,
        "id_mp_tipo_envio": idMpTipoEnvio,
        "motivo_estado": motivoEstado,
        "es_proforma": esProforma,
        "codigo_pedido": codigoPedido,
        "id_mp_tipo_descuento": idMpTipoDescuento,
        "total_descuento": totalDescuento,
        "id_comercio": idComercio,
        "nombre_comercio": nombreComercio,
        "direccion_comercio": direccionComercio,
        "celular_comercio": celularComercio,
        "latitud_comercio": latitudComercio,
        "longitud_comercio": longitudComercio,
      };
}
