import 'package:flutter/material.dart';
import 'package:medicinetsdriver/providers/sigin.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginProvider login = new LoginProvider();

  final _dataUser = <String, String>{
    'user': 'juan',
    'password': 'admin',
  };

  String user = '';
  String password = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Image(
          image: AssetImage('assets/images/logo_medicinets.png'),
          fit: BoxFit.cover,
          width: 290,
        ),
        const SizedBox(height: 5),
        const Text('Bienvenido a Medicinets Driver',
            style: TextStyle(
              color: ColorsM.textColor,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
            )),
        const SizedBox(height: 5),
        const Text(
          'Ingrese tu cuenta para continuar.',
          style: TextStyle(
              fontSize: 12,
              fontFamily: 'Quicksand',
              color: ColorsM.textColor,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: TextField(
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorsM.secondary),
              ),
              labelText: 'Usuario',
              labelStyle: TextStyle(
                  fontFamily: 'Quicksand', fontWeight: FontWeight.w600),
              icon: Icon(Icons.person),
            ),
            onChanged: (value) {
              user = value;
            },
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: TextField(
            obscureText: true,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorsM.secondary),
              ),
              labelText: 'Contraseña',
              labelStyle: TextStyle(
                  fontFamily: 'Quicksand', fontWeight: FontWeight.w600),
              icon: Icon(Icons.lock),
            ),
            onChanged: (text) {
              password = text;
            },
          ),
        ),
        const SizedBox(height: 40),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorsM.primary,
              textStyle: const TextStyle(
                  fontFamily: 'quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onPressed: () {
              _handlePassWord(context);
            },
            child: const Text('Ingresar'),
          ),
        )
      ])),
    );
  }

  void _handlePassWord(BuildContext context) {
    print({'user: $user', 'password: $password'});
    if (user == _dataUser['user'] && password == _dataUser['password']) {
      Navigator.pushReplacementNamed(context, '/activate');
    }
  }
}
