import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {@required this.index, @required this.name, @required this.onPress});

  final index;
  final name;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    Paint paint = Paint();
    paint.color = Colors.white54;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: this.onPress,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Color(0xffffde6f), BlendMode.dst),
              image: ExactAssetImage('assets/images/week-head.png', scale: 1),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    color: Colors.white60,
                    child: Text(this.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
