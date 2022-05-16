import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicinetsdriver/pages/home/DrawerHome.dart';

class PedididoDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Pedido Detalle'),
      ),
    );
  }
}
