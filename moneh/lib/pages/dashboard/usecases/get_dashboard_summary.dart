import 'package:flutter/material.dart';
import 'package:moneh/components/containers/dashboard.dart';
import 'package:moneh/modules/apis/stats/models/queries.dart';

import '../../../modules/apis/stats/services/queries.dart';

class GetDashboardSummary extends StatefulWidget {
  GetDashboardSummary({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetDashboardSummary createState() => _GetDashboardSummary();
}

class _GetDashboardSummary extends State<GetDashboardSummary> {
  QueriesStatsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesStatsService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getDashboardSummary(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesDashboardModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesDashboardModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesDashboardModel> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      width: fullWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              getDashboardContainer(null, "Last Income", contents[0].lastIncome,
                  contents[0].lastIncomeValue.toString(), "L"),
              const Spacer(),
              getDashboardContainer(
                  null,
                  "Last Spending",
                  contents[0].lastSpending,
                  contents[0].lastSpendingValue.toString(),
                  "R")
            ],
          ),
          Row(
            children: [
              getDashboardContainer(
                  null,
                  "Most Expensive Spending",
                  contents[0].mostExpensiveSpending,
                  contents[0].mostExpensiveSpendingValue.toString(),
                  "L"),
              const Spacer(),
              getDashboardContainer(
                  null,
                  "Most Highest Income",
                  contents[0].mostHighestIncome,
                  contents[0].mostHighestIncomeValue.toString(),
                  "R")
            ],
          ),
          Row(
            children: [
              getDashboardContainer(
                  null,
                  "Total Item (Income / Spending)",
                  "${contents[0].totalItemIncome} / ${contents[0].totalItemSpending}",
                  null,
                  "L"),
              const Spacer(),
              getDashboardContainer(null, "My Balance",
                  contents[0].myBalance.toString(), null, "R")
            ],
          )
        ],
      ),
    );
  }
}
