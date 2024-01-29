import 'package:flutter/material.dart';
import 'package:moneh/components/charts/pie_chart.dart';
import 'package:moneh/modules/apis/stats/models/queries.dart';
import 'package:moneh/modules/apis/stats/services/queries.dart';
import 'package:moneh/modules/variables/global.dart';
import 'package:moneh/modules/variables/style.dart';

class GetTotalWishlistByPriority extends StatefulWidget {
  const GetTotalWishlistByPriority({Key key}) : super(key: key);

  @override
  State<GetTotalWishlistByPriority> createState() =>
      _GetTotalWishlistByPriorityState();
}

class _GetTotalWishlistByPriorityState
    extends State<GetTotalWishlistByPriority> {
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
        future: apiService.getTotalWishlistByPriority(),
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
        child: getPieChart(chartData, 'Total Wishlist By Priority'));
  }
}
