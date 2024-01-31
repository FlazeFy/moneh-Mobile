import 'package:http/http.dart';
import 'package:moneh/modules/apis/flows/models/queries.dart';

class QueriesFlowService {
  final String baseUrl = "http://10.0.2.2:1323";
  Client client = Client();

  Future<List<QueriesSummary>> getFlowSummary() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/flows/summary/spending"),
    );
    if (response.statusCode == 200) {
      return queriesSummaryFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesGetAllFlow>> getAllFlow() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/flows/desc?page=1"),
    );
    if (response.statusCode == 200) {
      return queriesGetAllFlowFromJson(response.body);
    } else {
      return null;
    }
  }
}
