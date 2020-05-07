import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final Color color;

  Dots({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
}
