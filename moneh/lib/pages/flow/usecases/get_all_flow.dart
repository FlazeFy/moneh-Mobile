import 'package:flutter/material.dart';
import 'package:moneh/components/tables/table.dart';
import 'package:moneh/modules/apis/flows/models/queries.dart';
import 'package:moneh/modules/apis/flows/services/queries.dart';

class GetAllFlow extends StatefulWidget {
  GetAllFlow({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetAllFlow createState() => _GetAllFlow();
}

class _GetAllFlow extends State<GetAllFlow> {
  QueriesFlowService apiService;
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    apiService = QueriesFlowService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getAllFlow(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesGetAllFlow>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesGetAllFlow> contents = snapshot.data;
            items.clear();
            for (var el in contents) {
              items.add({
                "id": el.id,
                "flowType": el.flowType,
                "flowCategory": el.flowCategory,
                "flowName": el.flowName,
                "flowDesc": el.flowDesc,
                "flowAmmount": el.flowAmmount,
                "flowTag": el.flowTag,
                "isShared": el.isShared,
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

  Widget _buildListView(List<QueriesGetAllFlow> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    const builder = [
      {
        "column_name": "Type",
        "object_name": "flowType",
        "extra_desc": null,
        "type": 'select',
        "class": 'form-control',
        "label": 'Flow Type',
        "placeholder": 'Type flow type',
        "url": [
          {"dictionaries_name": "spending"},
          {"dictionaries_name": "income"}
        ],
      },
      {
        "column_name": "Category",
        "object_name": "flowCategory",
        "extra_desc": null,
        "type": 'select',
        "class": 'form-control',
        "label": 'Flow Category',
        "placeholder": 'Select flow category',
        "url": 'http://127.0.0.1:1323/api/v1/dct/flows_category?page=1'
      },
      {
        "column_name": "Name",
        "object_name": "flowName",
        "extra_desc": null,
        "type": 'text',
        "class": 'form-control',
        "label": 'Flow Name',
        "placeholder": 'Type flow name',
        "is_required": true,
        "is_obsecure": false,
        "maxLength": 75,
      },
      {
        "column_name": "Description",
        "object_name": "flowDesc",
        "extra_desc": null,
        "type": 'textarea',
        "class": 'form-control',
        "label": 'Flow Description',
        "is_required": true,
        "maxLength": 500,
      },
      {
        "column_name": "Ammount",
        "object_name": "flowAmmount",
        "extra_desc": null,
        "type": 'number',
        "class": 'form-control',
        "label": 'Flow Ammount',
        "placeholder": 'Type flow ammount',
        "is_required": true,
        "maxLength": 36,
      },
      {
        "column_name": "Tags",
        "object_name": "flowTag",
        "extra_desc": null,
        "type": 'tag',
        "class": 'btn btn-tag',
        "label": 'Flow Tag',
        "url": 'http://127.0.0.1:1323/api/v1/tag/desc?page=1'
      },
      {"column_name": "Manage", "object_name": null, "extra_desc": null}
    ];

    return SizedBox(
      width: fullWidth,
      child: getTable(builder, items),
    );
  }
}
