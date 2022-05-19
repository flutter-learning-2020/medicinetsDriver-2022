import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicinetsdriver/models/pedidos_model.dart';
import 'package:medicinetsdriver/models/solicitudes_model.dart';
import 'package:medicinetsdriver/providers/pedidos_provider.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class PedidosDriverPage extends StatefulWidget {
  final String idDriver;
  const PedidosDriverPage({Key? key, required this.idDriver}) : super(key: key);

  @override
  State<PedidosDriverPage> createState() =>
      _PedidosDriverPageState(idDriver: this.idDriver);
}

class _PedidosDriverPageState extends State<PedidosDriverPage> {
  final String idDriver;
  _PedidosDriverPageState({required this.idDriver});

  PedidosProvider _pedidosProvider = PedidosProvider();

  @override
  Widget build(BuildContext context) {
    return _indexPedidos(idDriver);
  }

  Widget _indexPedidos(String _idDriver) {
    return FutureBuilder(
      future: _pedidosProvider.getPedidos(_idDriver, '0'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.codigo == 0) {
            if (snapshot.data.data.listado.length > 0) {
              final List<Datum> _pedidos = snapshot.data.data.listado;

              return _showListCardPedidos(context, _pedidos);
            } else {
              return _listPedidosVacio();
            }
          } else {
            return _showMessage(snapshot.data.message);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _showListCardPedidos(BuildContext context, List<Datum> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return Container(
            height: 240,
            child: Card(
                elevation: 3.2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                      // color: ColorsM.primary,
                      // borderRadius: BorderRadius.all(Radius.circular(40.0))
                      ),
                  margin: EdgeInsets.all(12.0),
                  child: Column(children: <Widget>[
                    Container(
                      // color: Colors.green,
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Peido # ${data[index].id}',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsM.textColor,
                                )),
                            Container(
                                height: 32.0,
                                padding: EdgeInsets.only(
                                    right: 10.0,
                                    left: 10.0,
                                    top: 6.0,
                                    bottom: 6.0),
                                child: Text(
                                  'Caja Bs. ${data[index].totalNeto}',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: ColorsM.secondary,
                                ))
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // color: Colors.indigo,
                          margin: EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            'assets/images/icon_start_and_point.svg',
                            height: 100.0,
                            width: 20.0,
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data[index].nombreComercio != null ||
                                          data[index].nombreComercio != ''
                                      ? data[index].nombreComercio
                                      : 'Sin nombre',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsM.textColor),
                                ),
                                Text(
                                  data[index].direccionComercio != null ||
                                          data[index].direccionComercio != ''
                                      ? data[index].direccionComercio
                                      : 'Sin Direccion',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 16.0,
                                      color: ColorsM.textColor),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Dirección de entrega',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsM.textColor),
                                ),
                                Text(
                                  data[index].direccion != null ||
                                          data[index].direccion != ''
                                      ? data[index].direccion
                                      : 'Sin Direccion',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 16.0,
                                      color: ColorsM.textColor),
                                ),
                              ]),
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      width: MediaQuery.of(context).size.width,
                      height: 26.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorsM.primary,
                          textStyle: const TextStyle(
                              fontFamily: 'quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        onPressed: () {
                          Datum dataP = data[index];
                          final dataPedido = data[index];
                          Navigator.pushNamed(context, '/aceptarpedido',
                              arguments: dataPedido);
                        },
                        child: const Text('Aceptar pedido'),
                      ),
                    ),
                  ]),
                )),
          );
          ;
        }));
  }

  Widget _listPedidosVacio() {
    return Text('data');
  }

  Widget _showMessage(message) {
    return Text('sss');
  }
}
