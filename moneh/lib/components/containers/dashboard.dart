import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneh/components/typographies/label.dart';
import 'package:moneh/modules/variables/style.dart';

Widget getDashboardContainer(var route, String title, subtitle, val, pos) {
  getPosition(String side, init) {
    if (side != init) {
      return 0.0;
    } else {
      return spaceXMD;
    }
  }

  return GestureDetector(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.all(spaceMD),
          width: Get.width * 0.425,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              right: getPosition(pos, "R"),
              left: getPosition(pos, "L"),
              top: spaceMD),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [primaryColor, primaryColor.withOpacity(0.75)],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getLabel("normal", title, TextAlign.center, blackColor,
                  FontWeight.bold, textLG * 0.9),
              Container(margin: EdgeInsets.only(bottom: spaceSM)),
              getLabel("normal", subtitle, TextAlign.center, blackColor,
                  FontWeight.w700, textXLG),
              val != null && val.trim() != ""
                  ? getLabel("normal", val, TextAlign.center, blackColor,
                      FontWeight.w500, textXMD)
                  : const SizedBox(),
            ],
          )));
}
