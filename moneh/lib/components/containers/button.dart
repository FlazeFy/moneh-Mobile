import 'package:flutter/material.dart';
import 'package:moneh/modules/variables/style.dart';

Widget getButton(var act, String title, type) {
  if (type == "tag") {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: spaceMD, vertical: spaceSM),
        margin: EdgeInsets.only(right: spaceSM),
        decoration: BoxDecoration(
            color: infoBG,
            borderRadius: BorderRadius.all(Radius.circular(spaceMD))),
        child: Text(title));
  } else {
    return const SizedBox();
  }
}
