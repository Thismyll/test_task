import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class ApiService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
