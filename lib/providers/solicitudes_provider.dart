import 'package:medicinetsdriver/models/solicitudes_model.dart';

import '../models/state_response.dart';
import 'baseUrl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SolicitudesProvider {
  final _url = Uri.parse('${BaseUrl.baseUrl_server}/driver/listar_solicitudes');

  Future getSolicitudes(String idDriver) async {
    final response =
        await http.post(_url, body: {'id_driver': idDriver.toString()});
    final decodeData = await json.decode(response.body);
    print(decodeData);

    if (decodeData['Codigo'] == 0) {
      final solicitudes = await SolicitudesModel.fromJson(decodeData);
      return solicitudes;
    } else {
      return ResponseServer(codigo: 1, message: decodeData['Mensaje']);
    }
  }
}
