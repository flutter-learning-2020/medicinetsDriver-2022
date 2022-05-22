import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicinetsdriver/models/solicitudes_model.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class DestinoComercioPage extends StatefulWidget {
  const DestinoComercioPage({Key? key}) : super(key: key);

  @override
  State<DestinoComercioPage> createState() => _DestinoComercioPageState();
}

class _DestinoComercioPageState extends State<DestinoComercioPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    final Datum dataPedido =
        ModalRoute.of(context)?.settings.arguments as Datum;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
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
          const SizedBox(height: 8.0),
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
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/user_avatar.png'),
              ),
              SizedBox(width: 8.0),
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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: Size.infinite.height,
              // color: Colors.amber[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Detalles del pedido',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsM.textColor),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color.fromARGB(255, 187, 187, 187),
                          ),
                          margin: EdgeInsets.only(left: 10.0),
                          padding: EdgeInsets.all(4.0),
                          child: Text('2X',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                  color: ColorsM.textColor)),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              'nameProduct',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsM.textColor),
                            ),
                            trailing: Checkbox(
                                activeColor: ColorsM.secondary,
                                value: isChecked2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked2 = value ?? isChecked2;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Datos de facturación',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorsM.textColor,
                        fontSize: 18.0),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Razon social',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: ColorsM.textColor),
                                ),
                                Text(
                                  'NIT:',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: ColorsM.textColor),
                                ),
                              ],
                            ),
                            trailing: Checkbox(
                                activeColor: ColorsM.secondary,
                                value: isChecked1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked1 = value ?? isChecked1;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Carrito',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  color: ColorsM.textColor),
                            ),
                          ),
                          Text(
                            'Bs. 20.00',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: ColorM.textColor),
                          ),
                        ]),
                  ),
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Envío',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  color: ColorsM.textColor),
                            ),
                          ),
                          Text(
                            'Bs. 20.00',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: ColorM.textColor),
                          ),
                        ]),
                  ),
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Monto por pagar a Medicinets',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  color: ColorsM.textColor),
                            ),
                          ),
                          Text(
                            'Bs. 20.00',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: ColorM.textColor),
                          ),
                        ]),
                  ),
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Cupón (Carrito)',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  color: ColorsM.textColor),
                            ),
                          ),
                          Text(
                            'Bs. 20.00',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: ColorM.textColor),
                          ),
                        ]),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 10.0,
                    thickness: 1.5,
                  ),
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  color: ColorsM.textColor),
                            ),
                          ),
                          Text(
                            'Bs. 20.00',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: ColorM.textColor),
                          ),
                        ]),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.amber[100],
                    ),
                    child: Text(
                      'Recuerda que debes verificar que estén todos los productos del pedido.',
                      style:
                          TextStyle(color: ColorsM.textColor, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    color: ColorsM.textColor,
                    height: 10.0,
                    thickness: 1.0,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorsM.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            'Llevar pedido',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/direccionCliente',
                                arguments: dataPedido);
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
