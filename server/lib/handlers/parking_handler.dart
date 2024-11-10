import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../repositories/parking_repository.dart';
import '../models/parking.dart';

class ParkingHandler {
  final ParkingRepository repository;

  ParkingHandler(this.repository);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      final parkings = await repository.getAll();
      final response = jsonEncode(parkings.map((parking) => parking.toJson()).toList());
      return Response.ok(response, headers: {'Content-Type': 'application/json'});
    });

    router.get('/<id>', (Request request, String id) async {
      final parking = await repository.getById(int.parse(id));
      if (parking != null) {
        return Response.ok(jsonEncode(parking.toJson()), headers: {'Content-Type': 'application/json'});
      } else {
        return Response.notFound('Parking not found');
      }
    });

    router.post('/', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final parking = Parking.fromJson(data);
      await repository.add(parking);
      return Response.ok(jsonEncode(parking.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.put('/<id>', (Request request, String id) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final updatedParking = Parking.fromJson(data);
      await repository.update(updatedParking);
      return Response.ok(jsonEncode(updatedParking.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.delete('/<id>', (Request request, String id) async {
      final parking = await repository.getById(int.parse(id));
      if (parking != null) {
        await repository.delete(parking.id);
        return Response.ok('Parking deleted');
      } else {
        return Response.notFound('Parking not found');
      }
    });

    return router;
  }
}