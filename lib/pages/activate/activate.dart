import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class ActivatePage extends StatefulWidget {
  const ActivatePage({Key? key}) : super(key: key);

  @override
  State<ActivatePage> createState() => _ActivatePageState();
}

enum SingingCharacter { mascarillaAndCubreBocas, desinfectante, distansamiento }

class _ActivatePageState extends State<ActivatePage> {
  final String svgPathMotorbike = 'assets/images/motorbike.svg';
  SingingCharacter? _character = SingingCharacter.mascarillaAndCubreBocas;

  @override
  Widget build(BuildContext context) {
    final Widget _motorbikeSvg = SvgPicture.asset(svgPathMotorbike);
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              key: const Key('motorbike'),
              // color: Colors.amber,
              width: 200.0,
              height: 200.0,
              child: _motorbikeSvg,
            ),
            const SizedBox(height: 30.9),
            const Text('Hola, Juan Pérez',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: ColorsM.secondary,
                )),
            const SizedBox(height: 20),
            const Text(
              'Tu seguridad y la de los demás es importante, no olvides de cumplir con todos los protocolos de bioseguridad',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50.0),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30.0, right: 30.0),
              title: const Text('Tengo mascarilla o cubrebocas',
                  style: TextStyle(
                      color: ColorsM.textColor,
                      fontFamily: 'Quicksand',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
              trailing: Radio<SingingCharacter>(
                focusColor: const Color(0Xff3EC895),
                activeColor: const Color(0Xff3EC895),
                value: SingingCharacter.mascarillaAndCubreBocas,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30.0, right: 30.0),
              title: const Text('Desinfectaré mis manos',
                  style: TextStyle(
                      color: ColorsM.textColor,
                      fontFamily: 'Quicksand',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
              trailing: Radio<SingingCharacter>(
                focusColor: const Color(0Xff3EC895),
                activeColor: const Color(0Xff3EC895),
                value: SingingCharacter.desinfectante,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30.0, right: 30.0),
              title: const Text('Mantendré el distanciamiento',
                  style: TextStyle(
                      color: ColorsM.textColor,
                      fontFamily: 'Quicksand',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
              trailing: Radio<SingingCharacter>(
                focusColor: const Color(0Xff3EC895),
                activeColor: const Color(0Xff3EC895),
                value: SingingCharacter.distansamiento,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorsM.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Activar ahora',
                  style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253),
                      fontFamily: 'Quicksand',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  _handleActivarAhora(context);
                },
              ),
            ),
          ]),
    ));
  }

  void _handleActivarAhora(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/homePage');
  }
}
