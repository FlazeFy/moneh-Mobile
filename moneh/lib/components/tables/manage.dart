import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneh/components/containers/button.dart';
import 'package:moneh/components/forms/dropdown.dart';
import 'package:moneh/components/tables/table.dart';
import 'package:moneh/components/typographies/label.dart';
import 'package:moneh/modules/variables/style.dart';

Widget getManageTable(String ctx, var build, items, int idx) {
  return InkWell(
    child: Container(
        margin: EdgeInsets.all(spaceXSM),
        padding: EdgeInsets.all(spaceXSM),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(spaceSM))),
        child: Icon(Icons.edit, color: whiteColor)),
    onTap: () {
      showModalBottomSheet<void>(
        context: Get.context,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
              margin: EdgeInsets.only(top: spaceJumbo + spaceXLG),
              padding: EdgeInsets.zero,
              child: Column(children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: spaceLG),
                    child: Row(
                      children: [
                        getButton(
                            () => Get.back(), Icons.close, "icon", warningBG),
                        const Spacer(),
                        getButton(
                            () => Get.back(), Icons.check, "icon", successBG),
                      ],
                    )),
                Container(
                  height: Get.height * 0.8,
                  margin: EdgeInsets.only(top: spaceLG),
                  padding: EdgeInsets.all(spaceXMD),
                  decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(spaceXLG),
                          topRight: Radius.circular(spaceXLG))),
                  child: ListView(children: <Widget>[
                    getLabel("normal", "Edit $ctx", TextAlign.center,
                        primaryColor, FontWeight.bold, textXLG),
                    Container(margin: EdgeInsets.only(bottom: spaceXLG)),
                    Column(
                      children: [
                        for (var i = 0; i < items.length; i++)
                          if (i == idx)
                            for (var j = 0; j < build.length; j++)
                              Container(
                                  margin: EdgeInsets.only(bottom: spaceLG),
                                  child: build[j]['column_name'] != 'Manage'
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            getLabel(
                                                "normal",
                                                build[j]['column_name'],
                                                TextAlign.start,
                                                whiteColor,
                                                FontWeight.w600,
                                                textLG),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    bottom: spaceSM)),
                                            items[i][build[j]['object_name']] != null &&
                                                    items[i][build[j]["object_name"]] !=
                                                        ""
                                                ? SizedBox(
                                                    child: build[j]["type"] == "text" ||
                                                            build[j]["type"] ==
                                                                "textarea" ||
                                                            build[j]["type"] ==
                                                                "number"
                                                        ? TextFormField(
                                                            keyboardType: build[j]["type"] ==
                                                                    "number"
                                                                ? TextInputType
                                                                    .number
                                                                : TextInputType
                                                                    .text,
                                                            decoration:
                                                                InputDecoration(
                                                              focusedBorder:
                                                                  borderInputProp,
                                                              enabledBorder:
                                                                  borderInputProp,
                                                              fillColor:
                                                                  darkColor,
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          spaceSM,
                                                                      vertical:
                                                                          spaceXSM),
                                                              border:
                                                                  borderInputProp,
                                                              labelStyle: TextStyle(
                                                                  color:
                                                                      whiteColor),
                                                            ),
                                                            minLines: build[j]["type"] ==
                                                                    "textarea"
                                                                ? 3
                                                                : 1,
                                                            maxLines: build[j]
                                                                        ["type"] ==
                                                                    "textarea"
                                                                ? 3
                                                                : 1,
                                                            style: TextStyle(color: whiteColor),
                                                            initialValue: items[i][build[j]["object_name"]].toString())
                                                        : build[j]["type"] == "select"
                                                            ? getDropDown(build[j]['opt_select'], build[j]['opt_list'], build[j]['action'], false, null)
                                                            : build[j]["type"] == "tag"
                                                                ? Container(
                                                                    margin: EdgeInsets.symmetric(vertical: spaceMD),
                                                                    // constraints: BoxConstraints(
                                                                    //     maxWidth: Get.width * 0.65),
                                                                    child: getTag(items[i][build[j]["object_name"]].toString()))
                                                                : const SizedBox())
                                                : items[i][build[j]['column_name']] != 'Manage' && items[i][build[j]['object_name']] == null
                                                    ? const SizedBox()
                                                    : const SizedBox()
                                          ],
                                        )
                                      : const SizedBox())
                      ],
                    )
                  ]),
                )
              ]));
        },
      );
    },
  );
}
