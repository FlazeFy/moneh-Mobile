import 'package:flutter/material.dart';
import 'package:moneh/modules/variables/style.dart';

Widget getButton(var act, var title, String type, Color clr) {
  if (type == "tag") {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: spaceMD, vertical: spaceSM),
        margin: EdgeInsets.only(right: spaceSM),
        decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.all(Radius.circular(spaceMD))),
        child: Text(title));
  } else if (type == "icon") {
    return InkWell(
      onTap: act,
      child: Container(
        padding: EdgeInsets.all(spaceMD),
        decoration: BoxDecoration(
            color: clr,
            border: Border.all(width: spaceMini * 0.5, color: whiteColor),
            borderRadius: BorderRadius.all(Radius.circular(spaceLG))),
        child: Icon(title, color: whiteColor),
      ),
    );
  } else {
    return const SizedBox();
  }
}
