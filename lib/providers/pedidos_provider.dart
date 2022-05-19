import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:medicinetsdriver/models/pedidos_model.dart';
import 'package:medicinetsdriver/models/state_response.dart';
import 'package:medicinetsdriver/models/user_model.dart';
import 'package:medicinetsdriver/providers/baseUrl.dart';

class PedidosProvider {
  PedidosProvider();

  final _url = Uri.parse('${BaseUrl.baseUrl_server}/driver/listar_pedidos');

  Future getPedidos(String iddriver, String pagina) async {
    // try {
    final response =
        await http.post(_url, body: {'id_driver': iddriver, 'pagina': pagina});

    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodeData = await json.decode(response.body);
      print(decodeData);
      if (decodeData['Codigo'] == 0) {
        final pedidos = PedidosModel.fromJson(decodeData);
        return pedidos;
      } else {
        return ResponseServer(codigo: 1, message: decodeData['Mensaje']);
      }
    }
    return ResponseServer(codigo: 1, message: 'Error al traer los pedidos');
    // } catch (e) {
    //   return ResponseServer(codigo: 1, message: 'Error con la conexión');
    // }
  }
}
