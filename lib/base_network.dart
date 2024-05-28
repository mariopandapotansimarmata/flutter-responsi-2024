import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static const String baseUrl = "https://go-football-api-v44dfgjgyq-et.a.run.app";

  static Future<Map<String, dynamic>> getLeague(String partUrl) async {
    try {
       String fullUrl = "${baseUrl}/$partUrl";

      debugPrint("BaseNetwork - fullUrl : $fullUrl");
      var response = await http.get(Uri.parse(fullUrl));
      debugPrint("BaseNetwork - response : ${response.statusCode}");
      debugPrint("BaseNetwork - response : ${response.body}");
      if (response.statusCode == 200) {
        return _processResponseList(response);
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      return {"error": true, "message": "Failed to fetch data"};
    }
  }

  static Future<Map<String, dynamic>> _processResponseList(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}