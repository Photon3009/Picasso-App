import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtworkService {
  static const String apiKey = ''; // Replace with your actual API key

  static Future<List<dynamic>> searchPhotos(String query) async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=15'),
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['photos'];
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
