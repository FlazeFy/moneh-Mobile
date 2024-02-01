// Navigation
int page = 0;

// Initial Dropdown
var slctPocketType = "wallet";
var slctFlowCat = "transportation";
var slctFlowType = "spending";

// Filled by API dictionary
List<String> pocketTypeOpt = [];
List<String> flowCatOpt = [];

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
