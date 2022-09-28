import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class TopTen {
  late final List topTenUsers = [];

  static topTen() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    var response = await http.get(
      Uri.parse(
        'https://quizu.okoul.com/TopScores',
      ),
      headers: {'Authorization': token!},
    );
    print(jsonDecode(response.body).toString());
    return jsonDecode(response.body);
  }
}
