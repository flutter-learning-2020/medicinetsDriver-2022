import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicinetsdriver/models/user_model.dart';
import 'package:medicinetsdriver/pages/home/DrawerHome.dart';
import 'package:medicinetsdriver/pages/home/misGanancias/misGanancias.dart';
import 'package:medicinetsdriver/pages/home/pedidos/pedidos.dart';
import 'package:medicinetsdriver/providers/dirver_sactive_provider.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  bool _onActive = false;
  String _title = 'Pedidos';

  void _openDrawer() {
    _scaffolkey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  //switch body
  int _position = 0;

  _handlePosition(position, title) {
    setState(() {
      _position = position;
      _title = title;
    });
  }

  _selectedOptionDrawer(int position, idDriver) {
    switch (position) {
      case 0:
        return PedidosPage(
          idDriver: idDriver,
        );
      case 1:
        return MisGananciasPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Data _dataUser = ModalRoute.of(context)!.settings.arguments as Data;

    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: Text('$_title',
            style: TextStyle(
                color: ColorsM.secondary,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        actions: <Widget>[
          Switch(
              activeTrackColor: Color(0xFF3EC895),
              activeColor: Color.fromARGB(255, 253, 253, 253),
              value: _onActive,
              onChanged: (value) {
                setState(() {
                  _onActive = !_onActive;
                  _updateDriverState(context);
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
      drawer: drawerHome(context, _handlePosition, _dataUser),
      body: _selectedOptionDrawer(_position, _dataUser.id),
    );
  }

  _updateDriverState(BuildContext context) {
    final updateStateDriver = UpdateStateDriver();
    updateStateDriver.updateStateDriver(1, 1);
  }
}
