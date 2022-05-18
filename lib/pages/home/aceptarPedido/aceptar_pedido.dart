import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medicinetsdriver/models/pedidos_model.dart';
import 'package:medicinetsdriver/models/solicitudes_model.dart';
import 'package:medicinetsdriver/pages/home/DrawerHome.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class AceptarPedidoPage extends StatelessWidget {
  const AceptarPedidoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataPedido = ModalRoute.of(context)!.settings.arguments as Datum;
    final latComercio = double.parse(dataPedido.latitudComercio);
    final lngComercio = double.parse(dataPedido.longitudComercio);

    final _initialCamaraPosition = CameraPosition(
      target: LatLng(latComercio, lngComercio),
      zoom: 15,
    );

    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            _googleMap(
                dataPedido, _initialCamaraPosition, latComercio, lngComercio),
            _dataInfoBottom(context, dataPedido),
          ],
        ));
  }

  _googleMap(Datum dataPedido, CameraPosition initialCamaraPosition,
      double latComercio, double lngComercio) {
    return GoogleMap(
      initialCameraPosition: initialCamaraPosition,
      markers: {
        Marker(
          markerId: MarkerId('${dataPedido.nombreComercio}'),
          position: LatLng(latComercio, lngComercio),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
          infoWindow: InfoWindow(
            title: dataPedido.nombreComercio,
            snippet: dataPedido.direccionComercio,
          ),
        ),
      },
    );
  }

  _dataInfoBottom(BuildContext context, Datum dataPedido) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 6,
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {},
                        icon: Image.asset('assets/images/icon_google_maps.png'),
                        label: Text('Ver en Google Maps',
                            style: TextStyle(color: ColorsM.textColor))),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 6,
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {},
                        icon: Image.asset('assets/images/icon_waze.png'),
                        label: Text('Ver en Google Maps',
                            style: TextStyle(color: ColorsM.textColor))),
                  ),
                ),
              ],
            )),
            Container(
              // padding: EdgeInsets.only(right: 5, bottom: 5),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Dirígete al comercio',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorsM.secondary)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset(
                      'assets/images/icon_farmacord.png',
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.location_on_outlined,
                        color: ColorsM.primary, size: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataPedido.nombreComercio,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorsM.secondary),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          dataPedido.direccionComercio,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorsM.secondary),
                        ),
                      ],
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Contacto a Comercio',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorsM.textColor),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Size.infinite.width,
                    // color: Colors.amber,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 52.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: ColorsM.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 52.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: ColorsM.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.whatsapp,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          height: 52.0,
                          // width: 52.0,
                          decoration: BoxDecoration(
                            color: ColorsM.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            child: Text(
                              'Llegué a destino',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/destinocomercio',
                                  arguments: dataPedido);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
