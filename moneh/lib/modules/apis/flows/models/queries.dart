import 'dart:convert';

// Usecase summary
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

// Usecase get all flow
class QueriesGetAllFlow {
  String id;
  String flowType;
  String flowCategory;
  String flowName;
  String flowDesc;
  int flowAmmount;
  String flowTag;
  int isShared;

  QueriesGetAllFlow(
      {this.id,
      this.flowType,
      this.flowCategory,
      this.flowName,
      this.flowDesc,
      this.flowAmmount,
      this.flowTag,
      this.isShared});

  factory QueriesGetAllFlow.fromJson(Map<String, dynamic> map) {
    return QueriesGetAllFlow(
      id: map["id"],
      flowType: map["flows_type"],
      flowCategory: map["flows_category"],
      flowName: map["flows_name"],
      flowDesc: map["flows_desc"],
      flowAmmount: map["flows_ammount"],
      flowTag: map["flows_tag"],
      isShared: map["is_shared"],
    );
  }
}

List<QueriesGetAllFlow> queriesGetAllFlowFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesGetAllFlow>.from(
      data['data']['data'].map((item) => QueriesGetAllFlow.fromJson(item)));
}
