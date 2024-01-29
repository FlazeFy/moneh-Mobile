import 'package:http/http.dart' show Client;
import 'package:moneh/modules/apis/stats/models/queries.dart';

class QueriesStatsService {
  final String baseUrl = "http://10.0.2.2:1323";
  Client client = Client();

  Future<List<QueriesDashboardModel>> getDashboardSummary() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/dashboard"),
    );
    if (response.statusCode == 200) {
      return queriesDashboardModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPieChartModel>> getTotalFlowsItemByType() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/flowtype/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPieChartModel>> getTotalFlowsAmmountByType() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/ammountflowtype/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPieChartModel>> getTotalPocketByType() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/pockettype/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
