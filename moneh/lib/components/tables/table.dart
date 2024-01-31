import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneh/components/containers/button.dart';
import 'package:moneh/components/tables/manage.dart';
import 'package:moneh/modules/variables/style.dart';

Widget getTable(var build, items, String ctx) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: spaceMD),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataTextStyle: TextStyle(color: whiteColor),
                border: TableBorder.all(
                    color: greyColor,
                    borderRadius: BorderRadius.all(Radius.circular(spaceMD))),
                headingTextStyle: TextStyle(
                    color: whiteColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
                columns: <DataColumn>[
                  for (var i = 0; i < build.length; i++)
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          build[i]["column_name"],
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                ],
                rows: <DataRow>[
                  for (var i = 0; i < items.length; i++)
                    DataRow(
                      cells: <DataCell>[
                        for (var j = 0; j < build.length; j++)
                          items[i][build[j]['column_name']] != 'Manage' &&
                                  items[i][build[j]['object_name']] != null &&
                                  items[i][build[j]["object_name"]] != ""
                              ? DataCell(build[j]["type"] == "text" ||
                                      build[j]["type"] == "textarea" ||
                                      build[j]["type"] == "number" ||
                                      build[j]["type"] == "select"
                                  ? Text(items[i][build[j]["object_name"]]
                                      .toString())
                                  : build[j]["type"] == "tag"
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: spaceMD),
                                          // constraints: BoxConstraints(
                                          //     maxWidth: Get.width * 0.65),
                                          child: getTag(items[i]
                                                  [build[j]["object_name"]]
                                              .toString()))
                                      : const SizedBox())
                              : items[i][build[j]['column_name']] != 'Manage' &&
                                      items[i][build[j]['object_name']] == null
                                  ? DataCell(SizedBox(
                                      child:
                                          getManageTable(ctx, build, items, i),
                                    ))
                                  : const DataCell(SizedBox())
                      ],
                    ),
                ],
              ))));
}

Widget getTag(var tag) {
  var tags = jsonDecode(tag);

  return Wrap(
      children: tags.map<Widget>((tg) {
    return getButton(() {}, tg['tag_name'], "tag");
  }).toList());
}
