import 'package:flutter/material.dart';
import 'package:moneh/modules/helpers/converter.dart';
import 'package:moneh/modules/variables/style.dart';

Widget getDropDown(String slct, List<String> opt, Function(String) onChanged,
    bool separate, String divider) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: spaceSM),
      height: 40,
      margin: EdgeInsets.only(top: spaceXSM),
      decoration: BoxDecoration(
        border: Border.all(
          color: whiteColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(spaceSM),
      ),
      child: DropdownButton(
        value: slct,
        borderRadius: BorderRadius.all(Radius.circular(spaceMD)),
        dropdownColor: blackColor,
        underline: Container(
          height: 1.0,
          decoration: BoxDecoration(border: null, color: blackColor),
        ),
        style: TextStyle(fontSize: textXMD, color: whiteColor),
        items: opt.map((String item) {
          if (separate) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(ucFirst(
                  getSeparatedAfter(divider, item).replaceAll('_', ' '))),
            );
          } else {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }
        }).toList(),
        onChanged: onChanged,
      ));
}
