import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'objectbox.g.dart';
import 'models/person.dart';
import 'repositories/person_repository.dart';
import 'handlers/person_handler.dart';
import 'repositories/vehicle_repository.dart';
import 'models/vehicle.dart';
import 'handlers/vehicle_handler.dart';
import 'repositories/parking_space_repository.dart';
import 'models/parking_space.dart';
import 'handlers/parking_space_handler.dart';
import 'repositories/parking_repository.dart';
import 'models/parking.dart';
import 'handlers/parking_handler.dart';

void main() async {
  // Initialize ObjectBox store and repositories
  final store = await openStore();
  final personRepo = PersonRepository(store.box<Person>());
  final vehicleRepo = VehicleRepository(store.box<Vehicle>());
  final parkingSpaceRepo = ParkingSpaceRepository(store.box<ParkingSpace>());
  final parkingRepo = ParkingRepository(store.box<Parking>());

  // Set up handlers
  final personHandler = PersonHandler(personRepo);
  final vehicleHandler = VehicleHandler(vehicleRepo);
  final parkingSpaceHandler = ParkingSpaceHandler(parkingSpaceRepo);
  final parkingHandler = ParkingHandler(parkingRepo);

  // Set up main router
  final app = Router()
    ..mount('/persons', personHandler.router)
    ..mount('/vehicles', vehicleHandler.router)
    ..mount('/parkingspaces', parkingSpaceHandler.router)
    ..mount('/parkings', parkingHandler.router);

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);

  // Start the server
  final server = await io.serve(handler, InternetAddress.loopbackIPv4, 8080);
  print('Server listening on port ${server.port}');
}
