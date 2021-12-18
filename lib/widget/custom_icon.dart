import 'package:flutter/cupertino.dart';

Widget customIcon(String iconData, dynamic height, dynamic width) {
  return Image.asset(
    iconData,
    cacheHeight: height,
    cacheWidth: width,
  );
}
