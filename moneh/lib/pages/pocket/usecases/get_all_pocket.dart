import 'package:flutter/material.dart';
import 'package:moneh/components/tables/table.dart';
import 'package:moneh/modules/apis/pockets/models/queries.dart';
import 'package:moneh/modules/apis/pockets/services/queries.dart';

class GetAllPocket extends StatefulWidget {
  GetAllPocket({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetAllPocket createState() => _GetAllPocket();
}

class _GetAllPocket extends State<GetAllPocket> {
  QueriesPocketService apiService;
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    apiService = QueriesPocketService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getAllPocket(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesGetAllPocket>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesGetAllPocket> contents = snapshot.data;
            items.clear();
            for (var el in contents) {
              items.add({
                "id": el.id,
                "pocketName": el.pocketName,
                "pocketDesc": el.pocketDesc,
                "pocketType": el.pocketType,
                "pocketLimit": el.pocketLimit,
              });
            }
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesGetAllPocket> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    const builder = [
      {
        "column_name": "Name",
        "object_name": "pocketName",
        "extra_desc": null,
        "placeholder": 'Type pocket name',
        "type": 'text',
        "is_required": true,
        "maxLength": 144,
      },
      {
        "column_name": "Description",
        "object_name": "pocketDesc",
        "extra_desc": null,
        "placeholder": 'Type pocket description',
        "type": 'textarea',
        "is_required": true,
        "line": 4,
        "maxLength": 144,
      },
      {
        "column_name": "Type",
        "object_name": "pocketType",
        "extra_desc": null,
        "type": 'select',
        "class": "form-control",
        "placeholder": 'Select pocket type',
        "url": 'http://127.0.0.1:1323/api/v1/dct/pockets_type?page=1'
      },
      {
        "column_name": "Bottom Limit",
        "object_name": "pocketLimit",
        "is_required": true,
        "extra_desc": null,
        "type": 'number',
      },
      {"column_name": "Manage", "object_name": null, "extra_desc": null}
    ];

    return SizedBox(
      width: fullWidth,
      child: getTable(builder, items),
    );
  }
}
