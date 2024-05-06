import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://jsonplaceholder.typicode.com/";

  static Future<dynamic> get(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;

    final response = await http.get(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }



  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}
