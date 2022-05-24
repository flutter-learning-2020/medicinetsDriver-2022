import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medicinetsdriver/pages/activate/activate.dart';
import 'package:medicinetsdriver/pages/home/aceptarPedido/aceptar_pedido.dart';
import 'package:medicinetsdriver/pages/home/destinoComercio.dart/destino_comercio.dart';
import 'package:medicinetsdriver/pages/home/direccion_cliente/direccion_cliente_map.dart';
import 'package:medicinetsdriver/pages/home/home.dart';

import 'package:medicinetsdriver/pages/login/login.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enabled;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.light),
      theme: ThemeData(
          primarySwatch: ColorsM.secondary,
          secondaryHeaderColor: const Color(0xff324D84),
          fontFamily: 'Quicksand',
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 255, 255, 255),
              iconTheme: IconThemeData(
                color: ColorsM.secondary,
              ))),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/activate': (context) => ActivatePage(),
        '/homePage': (context) => HomePage(),
        '/aceptarpedido': (context) => AceptarPedidoPage(),
        '/destinocomercio': (context) => DestinoComercioPage(),
        '/direccionCliente': (context) => DireccionClientepMapPage()
      },
    );
  }
}
