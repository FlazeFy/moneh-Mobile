// Usecase summary
import 'dart:convert';

class QueriesSummary {
  int avg;
  int totalItem;
  int totalAmmount;

  QueriesSummary({this.avg, this.totalItem, this.totalAmmount});

  factory QueriesSummary.fromJson(Map<String, dynamic> map) {
    return QueriesSummary(
      avg: map["average"],
      totalItem: map["total_item"],
      totalAmmount: map["total_ammount"],
    );
  }
}

List<QueriesSummary> queriesSummaryFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesSummary>.from(
      data['data'].map((item) => QueriesSummary.fromJson(item)));
}
