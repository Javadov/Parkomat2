import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/person.dart';

class PersonRepository {
  final String baseUrl = 'http://localhost:8080/persons';

  Future<void> add(Person person) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(person.toJson()),
      );

      print('Person test3: $person');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Person added successfully');
      } else {
        print('Failed to add person: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error adding person: $e');
    }
  }

  Future<List<Person>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load persons');
    }
  }

  Future<Person?> getByPersonalNumber(String personalNumber) async {
    final response = await http.get(Uri.parse('$baseUrl/$personalNumber'));
    if (response.statusCode == 200) {
      return Person.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<void> update(Person person) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${person.personalNumber}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(person.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update person');
    }
  }

  Future<void> delete(String personalNumber) async {
    final response = await http.delete(Uri.parse('$baseUrl/$personalNumber'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete person');
    }
  }
}
