import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/parking.dart';

class ParkingRepository {
  final String baseUrl = 'http://localhost:8080/parkings';

  Future<void> add(Parking parking) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(parking.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add parking');
    }
  }

  Future<List<Parking>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Parking.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load parkings');
    }
  }

  Future<Parking?> getById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Parking.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<void> update(Parking parking) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${parking.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(parking.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update parking');
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete parking');
    }
  }
}
