import 'dart:convert';

// Usecase get dashboard (multi modules)
class QueriesDashboardModel {
  String lastIncome;
  String lastSpending;
  String mostExpensiveSpending;
  String mostHighestIncome;

  int lastIncomeValue;
  int lastSpendingValue;
  int mostExpensiveSpendingValue;
  int mostHighestIncomeValue;
  int totalItemIncome;
  int totalItemSpending;
  int myBalance;

  QueriesDashboardModel(
      {this.lastIncome,
      this.lastSpending,
      this.mostExpensiveSpending,
      this.mostHighestIncome,
      this.lastIncomeValue,
      this.lastSpendingValue,
      this.mostExpensiveSpendingValue,
      this.mostHighestIncomeValue,
      this.totalItemIncome,
      this.totalItemSpending,
      this.myBalance});

  factory QueriesDashboardModel.fromJson(Map<String, dynamic> map) {
    return QueriesDashboardModel(
        lastIncome: map["last_income"],
        lastSpending: map["last_spending"],
        mostExpensiveSpending: map["most_expensive_spending"],
        mostHighestIncome: map["most_highest_income"],
        lastIncomeValue: map["last_income_value"],
        lastSpendingValue: map["last_spending_value"],
        mostExpensiveSpendingValue: map["most_expensive_spending_value"],
        mostHighestIncomeValue: map["most_highest_income_value"],
        totalItemIncome: map["total_item_income"],
        totalItemSpending: map["total_item_spending"],
        myBalance: map["my_balance"]);
  }
}

List<QueriesDashboardModel> queriesDashboardModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesDashboardModel>.from(
      data['data'].map((item) => QueriesDashboardModel.fromJson(item)));
}

// Usecase get pie chart
class QueriesPieChartModel {
  String ctx;
  int total;

  QueriesPieChartModel({this.ctx, this.total});

  factory QueriesPieChartModel.fromJson(Map<String, dynamic> map) {
    return QueriesPieChartModel(
      ctx: map["context"],
      total: map["total"],
    );
  }
}

List<QueriesPieChartModel> queriesPieChartModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesPieChartModel>.from(
      data['data'].map((item) => QueriesPieChartModel.fromJson(item)));
}
