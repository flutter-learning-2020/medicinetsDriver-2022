import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medicinetsdriver/theme/ColorM.dart';

class ResenasPage extends StatelessWidget {
  final double _rating = 3.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.11,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_rating.toString(),
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsM.textColor)),
        ),
        Container(
          alignment: Alignment.center,
          width: Size.infinite.width,
          // color: Colors.amber[200],
          child: RatingBar.builder(
            ignoreGestures: true,
            glowColor: Colors.white,
            unratedColor: Color(0xffE6E6E6),
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: ColorsM.primary,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            '85 Calificaciones',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    ));
  }
}
