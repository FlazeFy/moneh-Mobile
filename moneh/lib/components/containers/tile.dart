import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneh/components/typographies/label.dart';
import 'package:moneh/modules/variables/style.dart';

Widget getTile(var route, String title, IconData icon, Color clr) {
  return GestureDetector(
      onTap: route,
      child: Container(
          padding: EdgeInsets.all(spaceMD),
          width: Get.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: spaceMD, left: spaceMD, top: spaceMD),
          decoration: BoxDecoration(
            color: clr,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: iconLG, color: blackColor),
              SizedBox(width: spaceLG),
              getLabel("normal", title, TextAlign.center, blackColor,
                  FontWeight.bold, textLG * 0.9)
            ],
          )));
}
