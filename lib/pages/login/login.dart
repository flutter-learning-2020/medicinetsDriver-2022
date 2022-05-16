import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicinetsdriver/flutter_bloc/user_bloc.dart';
import 'package:medicinetsdriver/models/user_model.dart';
import 'package:medicinetsdriver/providers/login_provider.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _dataUser = <String, String>{
    'user': 'juan',
    'password': 'admin',
  };

  String user = 'prueba@gmail.com';
  String password = '123456';
  bool isLoading = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Image(
          image: AssetImage('assets/images/logo_medicinets.png'),
          fit: BoxFit.contain,
          width: 275.0,
          height: 80.0,
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
            obscureText: _obscureText,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ColorsM.secondary),
              ),
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                  fontFamily: 'Quicksand', fontWeight: FontWeight.w600),
              icon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility_off_outlined),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
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

  _handlePassWord(BuildContext context) async {
    final loginProvider = LoginProvider();

    final response = await loginProvider.loginUser(user, password);
    // print(response!.nombre);
    print(response.codigo == 0);
    print({'user: $user', 'password: $password'});
    if (response.codigo == 0) {
      Navigator.pushReplacementNamed(context, '/activate', arguments: response);
    }
    if (response.codigo == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return _showAlert(context);
        },
      );
    }
  }

  _showAlert(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        "Error al iniciar sesion",
        style: TextStyle(
            fontFamily: 'Quicksand', fontWeight: FontWeight.w500, fontSize: 20),
      ),
      actions: [
        Container(
          width: double.infinity,
          height: 40.0,
          margin: EdgeInsets.all(0.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorsM.secondary,
              textStyle: const TextStyle(
                  fontFamily: 'quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            child: const Text('Aceptar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
