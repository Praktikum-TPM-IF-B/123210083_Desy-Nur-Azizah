import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://www.amiiboapi.com/api/';

  Future<List<dynamic>> getAmiiboList() async {
    final response = await http.get(Uri.parse('${baseUrl}amiibo/'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['amiibo'];
    } else {
      throw Exception('Failed to load amiibos');
    }
  }

  Future<Map<String, dynamic>> getAmiiboDetail(String id) async {
    final response = await http.get(Uri.parse('${baseUrl}amiibo/?id=$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['amiibo'];
    } else {
      throw Exception('Failed to load amiibo details');
    }
  }
}
