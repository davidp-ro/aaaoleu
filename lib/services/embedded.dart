import 'dart:convert';

import 'package:aaaoleu/models/embedded_res.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EmbeddedService {
  static Future<EmbeddedRes?> addModule(String uri) async {
    try {
      final data = await getData(uri);
      final prefs = await SharedPreferences.getInstance();

      List<String> moduleURIs = prefs.getStringList("MODULES") ?? [];
      moduleURIs.add(uri);
      prefs.setStringList("MODULES", moduleURIs);

      return data;
    } catch (e) {
      print("Failed to add module with error: $e");
      return null;
    }
  }

  static Future<void> removeModule(String uri) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> moduleURIs = prefs.getStringList("MODULES") ?? [];
    moduleURIs.removeWhere((element) => element == uri);
    prefs.setStringList("MODULES", moduleURIs);
  }

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
