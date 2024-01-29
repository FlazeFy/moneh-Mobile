import 'package:flutter/material.dart';
import 'package:moneh/modules/apis/stats/models/queries.dart';
import 'package:moneh/modules/apis/stats/services/queries.dart';
import 'package:moneh/modules/variables/global.dart';
import 'package:moneh/modules/variables/style.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class GetTotalFlowItemByType extends StatefulWidget {
  const GetTotalFlowItemByType({Key key}) : super(key: key);

  @override
  State<GetTotalFlowItemByType> createState() => _GetTotalFlowItemByTypeState();
}

class _GetTotalFlowItemByTypeState extends State<GetTotalFlowItemByType> {
  List<PieData> chartData = [];
  QueriesStatsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesStatsService();
  }

  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalFlowsByType(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesPieChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesPieChartModel> contents = snapshot.data;
            chartData.clear();

            for (var content in contents) {
              String label = content.ctx;
              int total = content.total;
              PieData pieData = PieData(label, total);
              chartData.add(pieData);
            }

            return _buildListView(chartData);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<PieData> contents) {
    return Container(
        margin: EdgeInsets.all(spaceSM),
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.all(Radius.circular(spaceSM)),
        ),
        child: SfCircularChart(
            title: ChartTitle(
                text: 'Total Flow Item By Type',
                textStyle: TextStyle(color: primaryColor)),
            legend: Legend(
                isVisible: true,
                padding: spaceLG,
                backgroundColor: darkColor,
                textStyle: TextStyle(color: whiteColor),
                borderColor: primaryColor),
            series: <CircularSeries>[
              PieSeries<PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: chartData,
                  xValueMapper: (PieData data, _) => data.xData,
                  yValueMapper: (PieData data, _) => data.yData,
                  dataLabelMapper: (PieData data, _) => data.text,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ]));
  }
}
