import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class LoginProvider {
  String email = '';
  String password = '';
  bool isLoading = false;

  final _url = '20.85.0.111:8191/api';

  Future<Map> login(String email, String password) async {
    final url = Uri.http(
        _url, '/driver/login', {"correo": email, "contraseña": password});

    final resp = await http.post(url);
    final decodeData = json.decode(resp.body);
    print(decodeData);

    return {};
  }
}
