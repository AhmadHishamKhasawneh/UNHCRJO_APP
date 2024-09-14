import 'dart:convert';
import 'package:http/http.dart' as http;
import 'vacancy.dart';

class ApiService {
  final String apiUrl = 'https://www.unhcrjo.org/jobs/api';

  Future<List<Vacancy>> fetchVacancies() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => Vacancy.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load vacancies');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
