import 'package:flutter/material.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class DestinoComercioPage extends StatefulWidget {
  const DestinoComercioPage({Key? key}) : super(key: key);

  @override
  State<DestinoComercioPage> createState() => _DestinoComercioPageState();
}

class _DestinoComercioPageState extends State<DestinoComercioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: Container(
        // color: Colors.amber[200],
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Container(
                height: 100,
                width: 140,
                // color: Color.fromARGB(255, 245, 232, 117),
                child: Expanded(
                  child: Image.asset('assets/images/icon_farmacord.png'),
                )),
            Expanded(
                child: Container(
                    height: 100,
                    // color: Color.fromARGB(255, 255, 250, 181),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Farmacord',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsM.textColor)),
                          const SizedBox(height: 5),
                          Text('2022-06-05 12:50:42.598',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsM.textColor)),
                          const SizedBox(height: 5),
                          Text('Pedido #8676E',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsM.textColor))
                        ]))),
          ]),
          Divider(
            height: 10.0,
            color: ColorsM.textColor,
            thickness: 1,
          ),
          const SizedBox(height: 10.0),
          Container(
            // color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Text(
              'Datos del cliente',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: ColorsM.textColor),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/user_avatar.png'),
              ),
              SizedBox(width: 10.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('nombre cliente',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: ColorsM.textColor)),
                      Text('1 Producto(s) en total',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: ColorsM.textColor)),
                      Text('Método de pago: Efectivo',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: ColorsM.textColor)),
                    ]),
              ),
              Container(
                  // color: Colors.green,
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: Column(children: <Widget>[
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: ColorsM.primary,
                            padding: EdgeInsets.all(8.0)),
                        onPressed: () {},
                        icon: Icon(Icons.whatsapp),
                        label: Text('Whatsapp')),
                    SizedBox(height: 10.0),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: ColorsM.primary,
                            padding: EdgeInsets.all(8.0)),
                        onPressed: () {},
                        icon: Icon(Icons.phone_in_talk_rounded),
                        label: Text('Whatsapp')),
                  ]))
            ],
          ),
          SizedBox(height: 10.0),
          Divider(
            height: 10.0,
            color: ColorsM.textColor,
            thickness: 1,
          ),
          _DetallePedido(),
        ]),
      ),
    );
  }

  _DetallePedido() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Detalles del pedido',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: ColorsM.textColor),
        )
      ],
    );
  }
}
