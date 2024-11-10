import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vehicle.dart';

class VehicleRepository {
  final String baseUrl = 'http://localhost:8080/vehicles';

  Future<void> add(Vehicle vehicle) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(vehicle.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add vehicle');
    }
  }

  Future<List<Vehicle>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Vehicle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicles');
    }
  }

  Future<Vehicle?> getByRegistrationNumber(String registrationNumber) async {
    final response = await http.get(Uri.parse('$baseUrl/$registrationNumber'));
    if (response.statusCode == 200) {
      return Vehicle.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<void> update(Vehicle vehicle) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${vehicle.registrationNumber}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(vehicle.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update vehicle');
    }
  }

  Future<void> delete(String registrationNumber) async {
    final response = await http.delete(Uri.parse('$baseUrl/$registrationNumber'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete vehicle');
    }
  }
}
