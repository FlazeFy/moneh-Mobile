import 'package:flutter/material.dart';
import 'package:moneh/components/charts/bar_chart.dart';
import 'package:moneh/modules/apis/stats/models/queries.dart';
import 'package:moneh/modules/apis/stats/services/queries.dart';
import 'package:moneh/modules/variables/global.dart';
import 'package:moneh/modules/variables/style.dart';

class GetTotalFlowByCat extends StatefulWidget {
  const GetTotalFlowByCat({Key key}) : super(key: key);

  @override
  State<GetTotalFlowByCat> createState() => _GetTotalFlowByCatState();
}

class _GetTotalFlowByCatState extends State<GetTotalFlowByCat> {
  List<BarData> chartData = [];
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
        future: apiService.getTotalFlowByCat(),
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
              double total = content.total.toDouble();
              BarData barData = BarData(label, total);
              chartData.add(barData);
            }

            return _buildListView(chartData);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<BarData> contents) {
    return Container(
        margin: EdgeInsets.all(spaceSM),
        child: getBarChart(chartData, 'Total Flow By Category'));
  }
}
