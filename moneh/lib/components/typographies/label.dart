import 'package:flutter/material.dart';
import 'package:moneh/modules/Variables/style.dart';

Widget getLabel(String type, String title, TextAlign alg, Color clr,
    FontWeight fw, double fs) {
  if (type == "normal") {
    return Text(title,
        textAlign: alg,
        style: TextStyle(
            color: clr,
            fontWeight: fw,
            fontSize: fs,
            letterSpacing: spaceMini * 0.25));
  } else {
    return const SizedBox();
  }
}
