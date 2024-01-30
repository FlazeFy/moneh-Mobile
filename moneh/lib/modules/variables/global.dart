// Navigation
int page = 0;

class PieData {
  PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}

class BarData {
  BarData(this.xData, this.yData);

  final String xData;
  final double yData;
}
