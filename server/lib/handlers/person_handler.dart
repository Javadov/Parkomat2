import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../repositories/person_repository.dart';
import '../models/person.dart';

class PersonHandler {
  final PersonRepository repository;

  PersonHandler(this.repository);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      final persons = await repository.getAll();
      final response = jsonEncode(persons.map((person) => person.toJson()).toList());
      return Response.ok(response, headers: {'Content-Type': 'application/json'});
    });

    router.get('/<personalNumber>', (Request request, String personalNumber) async {
      final person = await repository.getByPersonalNumber(personalNumber);
      if (person != null) {
        return Response.ok(jsonEncode(person.toJson()), headers: {'Content-Type': 'application/json'});
      } else {
        return Response.notFound('Person not found');
      }
    });

    router.post('/', (Request request) async {
      try {
        final payload = await request.readAsString();
        final data = jsonDecode(payload);
        final person = Person.fromJson(data);
        await repository.add(person);
        return Response.ok(jsonEncode(person.toJson()), headers: {'Content-Type': 'application/json'});
      } catch (e) {
        return Response.internalServerError(body: 'Failed to add person');
      }
    });

    router.put('/<personalNumber>', (Request request, String personalNumber) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final updatedPerson = Person.fromJson(data);
      await repository.update(updatedPerson);
      return Response.ok(jsonEncode(updatedPerson.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.delete('/<personalNumber>', (Request request, String personalNumber) async {
      final person = await repository.getByPersonalNumber(personalNumber);
      if (person != null) {
        await repository.delete(person.id);
        return Response.ok('Person deleted');
      } else {
        return Response.notFound('Person not found');
      }
    });

    return router;
  }
}
