import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/parking_space.dart';

class ParkingSpaceRepository {
  final String baseUrl = 'http://localhost:8080/parkingspaces';

  Future<void> add(ParkingSpace space) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(space.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add parking space');
    }
  }

  Future<List<ParkingSpace>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ParkingSpace.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load parking spaces');
    }
  }

  Future<ParkingSpace?> getById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return ParkingSpace.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<void> update(ParkingSpace space) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${space.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(space.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update parking space');
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete parking space');
    }
  }
}
