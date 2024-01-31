import 'package:http/http.dart';
import 'package:moneh/modules/apis/pockets/models/queries.dart';

class QueriesPocketService {
  final String baseUrl = "http://10.0.2.2:1323";
  Client client = Client();

  Future<List<QueriesGetAllPocket>> getAllPocket() async {
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/pockets/headers/desc?page=1"),
    );
    if (response.statusCode == 200) {
      return queriesGetAllPocketFromJson(response.body);
    } else {
      return null;
    }
  }
}
