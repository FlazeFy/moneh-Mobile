import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../modules/variables/global.dart';
import '../../modules/variables/style.dart';

Widget getBarChart(List<BarData> chartData, String title) {
  return SfCartesianChart(
      primaryXAxis: CategoryAxis(
          borderColor: whiteColor, labelStyle: TextStyle(color: whiteColor)),
      isTransposed: true,
      primaryYAxis: NumericAxis(
          rangePadding: ChartRangePadding.additional,
          labelStyle: TextStyle(color: whiteColor)),
      title: ChartTitle(text: title, textStyle: TextStyle(color: primaryColor)),
      series: <CartesianSeries<BarData, String>>[
        BarSeries<BarData, String>(
            color: primaryColor,
            dataSource: chartData,
            xValueMapper: (BarData data, _) => data.xData,
            yValueMapper: (BarData data, _) => data.yData,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(spaceSM),
                topLeft: Radius.circular(spaceSM)))
      ]);
}
