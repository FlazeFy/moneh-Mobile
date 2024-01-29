import 'package:flutter/material.dart';

Widget getLabel(String type, String title, TextAlign alg, Color clr,
    FontWeight fw, double fs) {
  if (type == "normal") {
    return Text(title,
        textAlign: alg,
        style: TextStyle(color: clr, fontWeight: fw, fontSize: fs));
  } else {
    return const SizedBox();
  }
}
