import 'package:flutter/material.dart';
import 'package:moneh/modules/Variables/style.dart';

Widget getAppbar(title) {
  return AppBar(
    backgroundColor: primaryColor,
    title: Text(title),
  );
}
