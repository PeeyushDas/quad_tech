import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

class MovieService {
  static const String baseUrl = 'https://api.tvmaze.com';

  Future<List<Show>> searchShows(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search/shows?q=$query'),
      );

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        List<Show> shows = body.map((dynamic item) {
          if (item is Map<String, dynamic>) {
            return Show.fromJson(item);
          }
          return Show.fromJson({'show': item});
        }).toList();

        return shows.where((show) => show.id != 0).toList();
      } else {
        throw Exception('Failed to load shows: ${response.body}');
      }
    } catch (e) {
      print('Error in searchShows: $e');
      throw Exception('Network error: $e');
    }
  }

  Future<List<Show>> getAllShows() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/shows'),
      );

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        List<Show> shows = body.map((dynamic item) {
          return Show.fromJson({'show': item});
        }).toList();

        return shows.where((show) => show.id != 0).toList();
      } else {
        throw Exception('Failed to load shows: ${response.body}');
      }
    } catch (e) {
      print('Error in getAllShows: $e');
      throw Exception('Network error: $e');
    }
  }
}
