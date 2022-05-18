import 'package:medicinetsdriver/models/dirver_active_model.dart';
import 'package:medicinetsdriver/models/state_response.dart';
import 'package:medicinetsdriver/providers/baseUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateStateDriver {
  UpdateStateDriver();

  final _url = Uri.parse('${BaseUrl.baseUrl_server}/driver/activado');

  Future updateStateDriver(num idDriver, num state) async {
    final response = await http.post(_url,
        body: {'id_driver': idDriver.toString(), 'activado': state.toString()});
    final decode = await json.decode(response.body);
    final dataResponse = await DriverActiveModel.fromJson(decode);
    if (dataResponse.codigo == 0) {
      return dataResponse;
    }
    if (dataResponse.codigo == 1) {
      return ResponseServer(
          codigo: 1, message: 'Error al actualizar el estado');
    }
  }
}
