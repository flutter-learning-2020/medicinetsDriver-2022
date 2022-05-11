import 'package:flutter/material.dart';
import 'package:medicinetsdriver/pages/activate/activate.dart';
import 'package:medicinetsdriver/pages/home/home.dart';
import 'package:medicinetsdriver/pages/login/login.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
