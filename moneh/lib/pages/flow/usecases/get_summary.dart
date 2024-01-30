import 'package:flutter/material.dart';
import 'package:moneh/components/typographies/label.dart';
import 'package:moneh/modules/apis/flows/models/queries.dart';
import 'package:moneh/modules/apis/flows/services/queries.dart';
import 'package:moneh/modules/helpers/converter.dart';
import 'package:moneh/modules/variables/style.dart';

class GetFlowSummary extends StatefulWidget {
  GetFlowSummary({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetFlowSummary createState() => _GetFlowSummary();
}

class _GetFlowSummary extends State<GetFlowSummary> {
  QueriesFlowService apiService;

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
        future: apiService.getFlowSummary(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesSummary>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesSummary> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesSummary> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: fullWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: spaceLG, vertical: spaceMD),
            child: Row(
              children: [
                Column(
                  children: [
                    getLabel("normal", "Average", TextAlign.center,
                        primaryColor, FontWeight.w500, textXLG),
                    getLabel("normal", numberToPrice(contents[0].avg),
                        TextAlign.center, whiteColor, FontWeight.w500, textLG)
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    getLabel("normal", "Total Item", TextAlign.center,
                        primaryColor, FontWeight.w500, textXLG),
                    getLabel("normal", numberToPrice(contents[0].avg),
                        TextAlign.center, whiteColor, FontWeight.w500, textLG)
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    getLabel("normal", "Total Ammount", TextAlign.center,
                        primaryColor, FontWeight.w500, textXLG),
                    getLabel("normal", numberToPrice(contents[0].avg),
                        TextAlign.center, whiteColor, FontWeight.w500, textLG)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
