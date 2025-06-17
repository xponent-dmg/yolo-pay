import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, String>> fetchFakeCardDetails() async {
  final url = Uri.parse('https://fakerapi.it/api/v2/creditCards?_quantity=1');

  Map<String, String> details = {'number': 'none', 'expiry': '00/00'};

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final card = data['data'][0];

      final number = card['number'];
      final expiry = '${card['expiration']}';

      details['number'] = number;
      details['expiry'] = expiry;
    } else {
      print('DEBUG: Error: ${response.statusCode}');
    }
  } catch (e) {
    print('DEBUG: Failed to fetch card: $e');
  }

  return details;
}
