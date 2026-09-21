import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:words_wisely/models/quote_model.dart';

class ApiService {
  Future<dynamic> fetchRandom() async {
    final response = await http.get(
      Uri.parse("https://zenquotes.io/api/random"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return QuoteModel.fromJson(data[0]);
    }
  }
}
