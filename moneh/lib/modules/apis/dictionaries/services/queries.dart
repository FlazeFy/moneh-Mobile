import 'package:http/http.dart';
import 'package:moneh/modules/apis/dictionaries/models/queries.dart';
import 'package:moneh/modules/variables/global.dart';

class DictionaryQueryService {
  final String baseUrl = "http://10.0.2.2:1323";
  Client client = Client();

  Future getDictionaryType(String type) async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/v1/dct/$type?page=1"));
    if (response.statusCode == 200) {
      if (type == "pockets_type") {
        var arrPocketType = dictionaryTypeModelFromJson(response.body);
        for (var e in arrPocketType) {
          pocketTypeOpt.add(e.name);
        }
        slctPocketType = pocketTypeOpt.first;
      } else if (type == "flows_category") {
        var arrFlowCat = dictionaryTypeModelFromJson(response.body);
        for (var e in arrFlowCat) {
          flowCatOpt.add(e.name);
        }
        slctFlowCat = flowCatOpt.first;
      }
    } else {
      return null;
    }
  }
}
