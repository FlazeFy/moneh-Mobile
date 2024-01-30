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

  Future<List<QueriesPieChartModel>> getTotalWishlistByType() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/wishlisttype/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPieChartModel>> getTotalWishlistByPriority() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/wishlistpriority/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPieChartModel>> getTotalWishlistByIsAchieved() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/wishlistisachieved/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPieChartModel>> getTotalDctByType() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/dcttype/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPieChartModel>> getTotalFlowByCat() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/stats/flowcat/desc"),
    );
    if (response.statusCode == 200) {
      return queriesPieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
