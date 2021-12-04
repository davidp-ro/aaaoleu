import 'dart:convert';

import 'package:aaaoleu/models/embedded_res.dart';
import 'package:http/http.dart' as http;

class EmbeddedService {
  static Future<EmbeddedRes?> getData(String uri) async {
    try {
      print("Fetching data from $uri");
      final url = Uri.parse(uri);
      final res = await http.get(url).timeout(const Duration(seconds: 5));

      return EmbeddedRes.fromJson(jsonDecode(res.body));
    } catch (e) {
      print("Failed to fetch data with error : $e");
      return null;
    }
  }
}
