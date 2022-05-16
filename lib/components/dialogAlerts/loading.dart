import 'package:flutter/material.dart';

class MyAlerts {
  String message = '';
  bool isLoading = false;

  //aun no se encuentra e funcionamiento de esta funcion
  Future<Widget> loading(BuildContext context) async {
    return AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text(message),
          ],
        ),
      ),
    );
  }
}
