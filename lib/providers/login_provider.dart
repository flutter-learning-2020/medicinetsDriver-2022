import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:medicinetsdriver/models/state_response.dart';
import 'package:medicinetsdriver/models/user_model.dart';
import 'package:medicinetsdriver/providers/baseUrl.dart';

class LoginProvider {
  String email = '';
  String password = '';
  bool isLoading = false;

  LoginProvider();

  final _url = Uri.parse('${BaseUrl.baseUrl_server}/driver/login');

  Future loginUser(String email, String password) async {
    try {
      final response = await http
          .post(_url, body: {'correo': email, 'contraseña': password});

      print(response.statusCode);
      if (response.statusCode == 200) {
        final decodeData = await json.decode(response.body);
        print(decodeData);
        if (decodeData['Codigo'] == 0) {
          final userData = await User.fromJson(decodeData);
          return userData;
        } else {
          return ResponseServer(codigo: 1, message: decodeData['Mensaje']);
        }
      }
      return ResponseServer(codigo: 1, message: 'Error al inciar sesión');
    } catch (e) {
      return ResponseServer(codigo: 1, message: 'Error con la conexión');
    }
  }
}
