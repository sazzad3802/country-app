import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  double wp = 0;
  Color color;
  String title;

  CustomTitle(
      {super.key, this.wp = 0, this.color = Colors.black, required this.title});

  @override
  Widget build(BuildContext context) {
    return wp == 0
        ? Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: color))
        : SizedBox(
            width: wp,
            child: Text(
              title,
              style: TextStyle(fontSize: 15, color: color),
            ));
    ;
  }
}
