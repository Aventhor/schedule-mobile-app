import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({@required this.index, @required this.name, @required this.onPress});

  final index;
  final name;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: this.onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}