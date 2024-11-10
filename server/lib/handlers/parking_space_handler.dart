import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../repositories/parking_space_repository.dart';
import '../models/parking_space.dart';

class ParkingSpaceHandler {
  final ParkingSpaceRepository repository;

  ParkingSpaceHandler(this.repository);

  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      final spaces = repository.getAll();
      final response = jsonEncode(spaces.map((space) => space.toJson()).toList());
      return Response.ok(response, headers: {'Content-Type': 'application/json'});
    });

    router.get('/<id>', (Request request, String id) {
      final space = repository.getById(int.parse(id));
      if (space != null) {
        return Response.ok(jsonEncode(space.toJson()), headers: {'Content-Type': 'application/json'});
      } else {
        return Response.notFound('Parking space not found');
      }
    });

    router.post('/', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final space = ParkingSpace.fromJson(data);
      repository.add(space);
      return Response.ok(jsonEncode(space.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.put('/<id>', (Request request, String id) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final updatedSpace = ParkingSpace.fromJson(data);
      repository.update(updatedSpace);
      return Response.ok(jsonEncode(updatedSpace.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.delete('/<id>', (Request request, String id) {
      final space = repository.getById(int.parse(id));
      if (space != null) {
        repository.delete(space.id);
        return Response.ok('Parking space deleted');
      } else {
        return Response.notFound('Parking space not found');
      }
    });

    return router;
  }
}