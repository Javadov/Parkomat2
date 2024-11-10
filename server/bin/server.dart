// import 'dart:convert';
// import 'dart:io';
// import 'package:objectbox/objectbox.dart';
// import 'package:shelf/shelf.dart';
// import 'package:shelf_router/shelf_router.dart';
// import 'package:shelf/shelf_io.dart' as io;
// import 'package:server/models/person.dart';
// import 'package:server/models/vehicle.dart';
// import 'package:server/models/parking_space.dart';
// import 'package:server/models/parking.dart';
// //import 'package:server/objectbox.g.dart';

// late final Store store;
// late final Box<Person> personBox;
// late final Box<Vehicle> vehicleBox;
// late final Box<ParkingSpace> parkingSpaceBox;
// late final Box<Parking> parkingBox;

// void main() async {
//   store = await openStore();
//   personBox = store.box<Person>();
//   vehicleBox = store.box<Vehicle>();
//   parkingSpaceBox = store.box<ParkingSpace>();
//   parkingBox = store.box<Parking>();

//   final app = Router();

//   // Person Routes
//   app.get('/persons', getAllPersons);
//   app.get('/persons/<id>', getPersonById);
//   app.post('/persons', createPerson);

//   // Vehicle Routes
//   app.get('/vehicles', getAllVehicles);
//   app.get('/vehicles/<id>', getVehicleById);
//   app.post('/vehicles', createVehicle);

//   // ParkingSpace Routes
//   app.get('/parkingspaces', getAllParkingSpaces);
//   app.get('/parkingspaces/<id>', getParkingSpaceById);
//   app.post('/parkingspaces', createParkingSpace);

//   // Parking Routes
//   app.get('/parkings', getAllParkings);
//   app.get('/parkings/<id>', getParkingById);
//   app.post('/parkings', createParking);

//   final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);
//   final server = await io.serve(handler, InternetAddress.loopbackIPv4, 8080);
//   print('Server listening on port ${server.port}');
// }

// // Person Handlers
// Response getAllPersons(Request request) {
//   final personList = personBox.getAll();
//   return Response.ok(jsonEncode(personList.map((p) => p.toJson()).toList()));
// }

// Response getPersonById(Request request, String id) {
//   final person = personBox.get(int.parse(id));
//   return person != null ? Response.ok(jsonEncode(person.toJson())) : Response.notFound('Person not found');
// }

// Future<Response> createPerson(Request request) async {
//   final payload = await request.readAsString();
//   final person = Person.fromJson(jsonDecode(payload));
//   personBox.put(person);
//   return Response.ok(jsonEncode(person.toJson()));
// }

// // Vehicle Handlers
// Response getAllVehicles(Request request) {
//   final vehicleList = vehicleBox.getAll();
//   return Response.ok(jsonEncode(vehicleList.map((v) => v.toJson()).toList()));
// }

// Response getVehicleById(Request request, String id) {
//   final vehicle = vehicleBox.get(int.parse(id));
//   return vehicle != null ? Response.ok(jsonEncode(vehicle.toJson())) : Response.notFound('Vehicle not found');
// }

// Future<Response> createVehicle(Request request) async {
//   final payload = await request.readAsString();
//   final vehicle = Vehicle.fromJson(jsonDecode(payload));
//   vehicleBox.put(vehicle);
//   return Response.ok(jsonEncode(vehicle.toJson()));
// }

// // ParkingSpace Handlers
// Response getAllParkingSpaces(Request request) {
//   final parkingSpaceList = parkingSpaceBox.getAll();
//   return Response.ok(jsonEncode(parkingSpaceList.map((ps) => ps.toJson()).toList()));
// }

// Response getParkingSpaceById(Request request, String id) {
//   final parkingSpace = parkingSpaceBox.get(int.parse(id));
//   return parkingSpace != null ? Response.ok(jsonEncode(parkingSpace.toJson())) : Response.notFound('Parking Space not found');
// }

// Future<Response> createParkingSpace(Request request) async {
//   final payload = await request.readAsString();
//   final parkingSpace = ParkingSpace.fromJson(jsonDecode(payload));
//   parkingSpaceBox.put(parkingSpace);
//   return Response.ok(jsonEncode(parkingSpace.toJson()));
// }

// // Parking Handlers
// Response getAllParkings(Request request) {
//   final parkingList = parkingBox.getAll();
//   return Response.ok(jsonEncode(parkingList.map((p) => p.toJson()).toList()));
// }

// Response getParkingById(Request request, String id) {
//   final parking = parkingBox.get(int.parse(id));
//   return parking != null ? Response.ok(jsonEncode(parking.toJson())) : Response.notFound('Parking not found');
// }

// Future<Response> createParking(Request request) async {
//   final payload = await request.readAsString();
//   final parking = Parking.fromJson(jsonDecode(payload));
//   parkingBox.put(parking);
//   return Response.ok(jsonEncode(parking.toJson()));
// }