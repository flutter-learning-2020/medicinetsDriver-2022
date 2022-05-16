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
    print(decode);
  }
}
