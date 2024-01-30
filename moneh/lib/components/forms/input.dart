import 'package:flutter/material.dart';

import '../../modules/variables/style.dart';

Widget getInputDesc(int len, int lines, var ctrl, bool secure) {
  return Container(
    padding: EdgeInsets.only(top: spaceSM * 0.2),
    child: TextField(
      cursorColor: darkColor,
      maxLength: len,
      autofocus: false,
      controller: ctrl,
      obscureText: secure,
      maxLines: lines,
      minLines: lines,
      style: TextStyle(fontSize: textXMD),
      decoration: InputDecoration(
        fillColor: whiteColor,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spaceMD),
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spaceMD),
          borderSide: BorderSide(color: greyColor),
        ),
      ),
    ),
  );
}
