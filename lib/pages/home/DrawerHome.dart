import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicinetsdriver/models/user_model.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget drawerHome(
    BuildContext context, Function _handlePosition, Data dataUser) {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  // actualiza los datos de user preferences en el login
  Future<void> _cerarSesion() async {
    final SharedPreferences prefs = await preferences;
    String dataUser = await (prefs.getString('dataUser') ?? '');
    final dataDecode = await json.decode(dataUser);
    dataDecode['email'] = '';
    dataDecode['password'] = '';
    dataDecode['isLoging'] = false;
    String encodedData = await json.encode(dataDecode);
    prefs.setString('dataUser', encodedData);
    // print(encodedData);
  }

  double statusBarHeight = MediaQuery.of(context).padding.top;
  const paddinLeft = EdgeInsets.only(left: 30.0);
  const _textStyle = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 15.0,
      color: ColorsM.textColor,
      fontWeight: FontWeight.bold);

  return Container(
    width: 260,
    margin: EdgeInsets.only(top: statusBarHeight),
    // padding: EdgeInsets.only(top: statusBarHeight),
    child: Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(60.0),
            bottomRight: Radius.circular(60.0)),
      ),
      child: ListView(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Container(
                  width: 130,
                  height: 90,
                  child: Image.asset('assets/images/logo_medicinets.png'),
                ),
                Text(
                  dataUser.nombre,
                  style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: ColorsM.secondary),
                )
              ])),
          ListTile(
              contentPadding: paddinLeft,
              leading: const Icon(Icons.list_alt),
              title: const Text('Pedidos', style: _textStyle),
              onTap: () {
                Navigator.pop(context);
                _handlePosition(0, 'Pedidos');
              }),
          ListTile(
            contentPadding: paddinLeft,
            leading: const Icon(Icons.monetization_on_outlined),
            title: const Text('Mi ganancias', style: _textStyle),
            onTap: () {
              Navigator.pop(context);
              _handlePosition(1, 'Mi ganancias');
            },
          ),
          ListTile(
              contentPadding: paddinLeft,
              leading: const Icon(Icons.star_purple500_outlined),
              title: const Text(
                'Reseñas',
                style: _textStyle,
              ),
              onTap: () {
                Navigator.pop(context);
                _handlePosition(2, 'Reseñas');
              }),
          const Divider(
            thickness: 1,
          ),
          ListTile(
              contentPadding: paddinLeft,
              leading: SvgPicture.asset('assets/images/icon_ayuda.svg'),
              title: const Text('Ayuda', style: _textStyle),
              onTap: () {
                Navigator.pop(context);
                _handlePosition(3, 'Ayuda');
              }),
          ListTile(
            contentPadding: paddinLeft,
            leading: SvgPicture.asset('assets/images/icon_cerrar_sesion.svg'),
            title: const Text('Cerrar sesión', style: _textStyle),
            onTap: () {
              _cerarSesion();
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
              _handlePosition(4, '');
            },
          ),
          const SizedBox(
            height: 90.0,
          ),
          const Divider(height: 1),
          const ListTile(
            title: Text('v20220415.1.0.5',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: ColorsM.textColor,
                )),
          ),
        ],
      ),
    ),
  );
}
