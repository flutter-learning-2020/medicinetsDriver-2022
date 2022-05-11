import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicinetsdriver/pages/home/DrawerHome.dart';
import 'package:medicinetsdriver/pages/home/misGanancias/misGanancias.dart';
import 'package:medicinetsdriver/pages/home/pedidos/pedidos.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  bool _onActive = false;

  void _openDrawer() {
    _scaffolkey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  //switch body
  int _position = 0;

  _handlePosition(position) {
    setState(() {
      _position = position;
    });
  }

  _selectedOptionDrawer(int position) {
    switch (position) {
      case 0:
        return PedidosPage();
      case 1:
        return MisGananciasPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: const Text('Pedidos',
            style: TextStyle(
                color: ColorsM.secondary,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        actions: <Widget>[
          Switch(
              value: _onActive,
              onChanged: (value) {
                setState(() {
                  _onActive = !_onActive;
                });
              }),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: ColorsM.secondary,
            size: 35.0,
          ),
          onPressed: () {
            _openDrawer();
          },
        ),
        centerTitle: true,
      ),
      drawer: drawerHome(context, _handlePosition),
      body: _selectedOptionDrawer(_position),
    );
  }
}
