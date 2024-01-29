import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../modules/variables/global.dart';
import '../../modules/variables/style.dart';

Widget getPieChart(List<PieData> chartData, String title) {
  return SfCircularChart(
      title: ChartTitle(text: title, textStyle: TextStyle(color: primaryColor)),
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
      ]);
}
