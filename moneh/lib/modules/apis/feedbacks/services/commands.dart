import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' show Client;
import 'package:moneh/modules/apis/feedbacks/models/commands.dart';

class FeedbackCommandsService {
  final String baseUrl = "http://10.0.2.2:1323";

  Client client = Client();

  Future<List<Map<String, dynamic>>> postFeedback(FeedbackModel data) async {
    final Uri url = Uri.parse("$baseUrl/api/v1/feedbacks");

    final http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.headers['Content-Type'] = 'multipart/form-data';

    request.fields['feedbacks_rate'] = data.rate.toString();
    request.fields['feedbacks_desc'] = data.desc;

    try {
      final http.Response response =
          await http.Response.fromStream(await request.send());
      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return [
          {
            "message": "success",
            "body": responseData["message"],
          }
        ];
      } else {
        return [
          {"message": "failed", "body": responseData['message']}
        ];
      }
    } catch (error) {
      return [
        {"message": "error", "body": "Error sending the request: $error"}
      ];
    }
  }
}
