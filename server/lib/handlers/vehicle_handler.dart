import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../repositories/vehicle_repository.dart';
import '../models/vehicle.dart';

class VehicleHandler {
  final VehicleRepository repository;

  VehicleHandler(this.repository);

  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      final vehicles = repository.getAll();
      final response = jsonEncode(vehicles.map((vehicle) => vehicle.toJson()).toList());
      return Response.ok(response, headers: {'Content-Type': 'application/json'});
    });

    router.get('/<registrationNumber>', (Request request, String registrationNumber) {
      final vehicle = repository.getByRegistrationNumber(registrationNumber);
      if (vehicle != null) {
        return Response.ok(jsonEncode(vehicle.toJson()), headers: {'Content-Type': 'application/json'});
      } else {
        return Response.notFound('Vehicle not found');
      }
    });

    router.post('/', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final vehicle = Vehicle.fromJson(data);
      repository.add(vehicle);
      return Response.ok(jsonEncode(vehicle.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.put('/<registrationNumber>', (Request request, String registrationNumber) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final updatedVehicle = Vehicle.fromJson(data);
      repository.update(updatedVehicle);
      return Response.ok(jsonEncode(updatedVehicle.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.delete('/<registrationNumber>', (Request request, String registrationNumber) {
      final vehicle = repository.getByRegistrationNumber(registrationNumber);
      if (vehicle != null) {
        repository.delete(vehicle.id);
        return Response.ok('Vehicle deleted');
      } else {
        return Response.notFound('Vehicle not found');
      }
    });

    return router;
  }
}
