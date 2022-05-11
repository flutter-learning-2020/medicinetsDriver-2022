import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({Key? key}) : super(key: key);

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final List<Map<String, String>> _pedidos = [
    {
      'name': 'Pedido 1',
    },
    {
      'name': 'Pedido 2',
    },
    {
      'name': 'Pedido 3',
    }
  ];

  @override
  Widget build(BuildContext context) {
    if (_pedidos.length > 0) {
      return _showListPedidos(_pedidos, context);
    } else {
      return _listPedidosVacio();
    }
  }

  Widget _listPedidosVacio() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              key: const Key('bag'),
              width: 200.9,
              height: 200.0,
              child: SvgPicture.asset('assets/images/bag.svg'),
            ),
            const SizedBox(height: 30.9),
            const Text(
              'No hay nuevas órdenes',
              style: TextStyle(
                  fontFamily: 'quicksand',
                  fontSize: 22.0,
                  color: ColorsM.secondary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Permanece atento a las notificaciones para emperzar a repartir',
                style: TextStyle(
                  fontFamily: 'quicksand',
                  fontSize: 14.0,
                  color: ColorsM.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ]),
    );
  }

  Widget _showListPedidos(
      List<Map<String, String>> pedidos, BuildContext context) {
    return ListView.builder(
      itemCount: pedidos == null ? 0 : pedidos.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(
                  // color: ColorsM.primary,

                  ),
              margin: EdgeInsets.all(12.0),
              child: Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Peido # 2c3453',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            color: ColorsM.textColor,
                          )),
                      Container(
                          height: 35.0,
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 4.0, bottom: 3.0),
                          child: Text(
                            'Caja Bs. 23.0',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ColorsM.secondary,
                          ))
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/icon_start_and_point.svg',
                      height: 100.0,
                      width: 20.0,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Farmacord-avenida beni'),
                          Text('Av. Beni 4to Anillo'),
                          Text('Farmacord-avenida beni'),
                          Text('Av. Beni 4to Anillo'),
                        ])
                  ],
                )
              ]),
            ));
      },
    );
  }
}