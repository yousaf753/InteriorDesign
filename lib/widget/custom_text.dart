import 'package:flutter/cupertino.dart';

Widget customText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    maxLines: 1,
    textAlign: TextAlign.left,
  );
}
