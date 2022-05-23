import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicinetsdriver/flutter_bloc/user_bloc.dart';
import 'package:medicinetsdriver/models/user_model.dart';
import 'package:medicinetsdriver/providers/login_provider.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> _dataUser = <String, dynamic>{
    'email': '',
    'password': '',
    'isLoging': false,
  };

  String user = 'prueba@gmail.com';
  String password = '123456';
  bool isLoading = false;
  bool _obscureText = true;

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  Future<int>? _counter;
  Future<String>? _dataLoginUser;

  Future<void> _updateData() async {
    _dataUser['email'] = user;
    _dataUser['password'] = password;
    _dataUser['isLoging'] = true;

    final SharedPreferences prefs = await preferences;
    // final String _dataUs2 = (prefs.getString('email') ?? '');
    String encodedData = await json.encode(_dataUser);
    print(encodedData);

    // late int counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setString('dataUser', encodedData);

    // setState(() {
    //   _counter = prefs.setInt('counter', counter).then((bool succes) {
    //     return counter;
    //   });
    // });
  }

  _getData() async {
    final SharedPreferences prefs = await preferences;
    final String _dataUs = (prefs.getString('dataUser') ??
        """{"isLoging":false,"email":"","password":""}""");
    final Map<String, dynamic> _dataUser = json.decode(_dataUs);
    this._dataUser = _dataUser;
    user = _dataUser['email'];
    password = _dataUser['password'];
  }

  @override
  void initState() {
    super.initState();
    // _counter = preferences.then((SharedPreferences prefs) {
    //   return prefs.getInt('counter') ?? 0;
    // });
    _dataLoginUser = preferences.then((SharedPreferences prefs2) {
      return prefs2.getString('dataUser') ?? '';
    });
    _getData();
  }

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
      body: FutureBuilder(
          future: _dataLoginUser,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              bool isLoging = _dataUser['isLoging'];
              if (isLoging) {
                _autoLogin(context);
                return Center(
                  child: CircularProgressIndicator(),
                );
                // return Center(
                //   child: Text('cargar page activare'),
                // );
              } else {
                return _loginUi();
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _updateData();
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }

  _loginUi() {
    return Center(
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
          style: const TextStyle(
            fontSize: 18.0,
            fontFamily: 'Quicksand',
            color: ColorsM.textColor,
          ),
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsM.secondary),
            ),
            labelText: 'Usuario',
            labelStyle: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w600,
                fontSize: 16.0),
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
          style: const TextStyle(
              fontFamily: 'quicksand',
              fontSize: 16.0,
              color: ColorsM.textColor),
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
              icon: _obscureText
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
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
      ),
      // Text('${snapshot.data}'),
    ]));
  }

  _handlePassWord(BuildContext context) async {
    final loginProvider = LoginProvider();

    final response = await loginProvider.loginUser(user, password);
    // print(response!.nombre);
    print(response.codigo == 0);
    print({'user: $user', 'password: $password'});

    // setDataUs(response.email);

    if (response.codigo == 0) {
      // setState(() {
      _updateData();
      // });
      Navigator.pushReplacementNamed(context, '/activate', arguments: response);
    }
    if (response.codigo == 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return _showAlert(context, response.message);
        },
      );
    }
  }

  _autoLogin(BuildContext context) async {
    final loginProvider = LoginProvider();

    final response = await loginProvider.loginUser(user, password);

    print(response.codigo == 0);
    print({'user: $user', 'password: $password'});

    if (response.codigo == 0) {
      // setState(() {
      //   _updateData();
      // });
      Navigator.pushNamed(context, '/activate', arguments: response);
    }
    if (response.codigo == 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return _showAlert(context, response.message);
        },
      );
    }
  }

  _showAlert(BuildContext context, String mensaje) {
    return CupertinoAlertDialog(
      title: Text(
        mensaje,
        style: const TextStyle(
            fontFamily: 'Quicksand', fontWeight: FontWeight.w500, fontSize: 20),
      ),
      actions: [
        Container(
          width: double.infinity,
          height: 40.0,
          margin: const EdgeInsets.all(0.0),
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
