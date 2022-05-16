import 'package:flutter/material.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class MisGananciasPage extends StatefulWidget {
  const MisGananciasPage({Key? key}) : super(key: key);
  @override
  State<MisGananciasPage> createState() => _MisGananciasPageState();
}

class _MisGananciasPageState extends State<MisGananciasPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 0.0,
          bottom: TabBar(
            tabs: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Hoy',
                  style: TextStyle(
                      color: ColorsM.primary,
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Mes',
                  style: TextStyle(
                      color: ColorsM.primary,
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Total',
                  style: TextStyle(
                      color: ColorsM.primary,
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '\Bs 0.00',
                    style: TextStyle(
                        color: ColorsM.primary,
                        fontSize: 30,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Ganancias',
                    style: TextStyle(
                        color: ColorsM.primary,
                        fontSize: 17,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Al día de hoy 30/03/2022 11:40 a. m.',
                      style: TextStyle(
                          color: ColorsM.textColor,
                          fontSize: 14,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text(
                        'Pedidos',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Quicksand',
                            fontSize: 18,
                            color: ColorsM.secondary),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Text(
                                    'Order #$index',
                                    style: TextStyle(
                                        color: ColorsM.primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Farmacord',
                                    textAlign: TextAlign.end,
                                  ),
                                  leading: Text(
                                    'COMERCIO',
                                    style: TextStyle(
                                        color: ColorsM.secondary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
