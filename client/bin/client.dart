import 'dart:io';
import 'package:client/repositories/person_repository.dart';
import 'package:client/repositories/vehicle_repository.dart';
import 'package:client/repositories/parking_space_repository.dart';
import 'package:client/repositories/parking_repository.dart';
import 'package:client/handlers/person_handler.dart';
import 'package:client/handlers/vehicle_handler.dart';
import 'package:client/handlers/parking_space_handler.dart';
import 'package:client/handlers/parking_handler.dart';

void main() async {
  final personRepo = PersonRepository();
  final vehicleRepo = VehicleRepository();
  final spaceRepo = ParkingSpaceRepository();
  final parkingRepo = ParkingRepository();

  while (true) {
    print('\nVälkommen till Parkeringsappen!');
    print('1. Hantera personer');
    print('2. Hantera fordon');
    print('3. Hantera parkeringsplatser');
    print('4. Hantera parkeringar');
    print('5. Avsluta');
    stdout.write('Välj ett alternativ (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await managePersons(personRepo);
        break;
      case '2':
        await manageVehicles(vehicleRepo, personRepo);
        break;
      case '3':
        await manageParkingSpaces(spaceRepo);
        break;
      case '4':
        await manageParkings(parkingRepo, vehicleRepo, spaceRepo);
        break;
      case '5':
        print('Avslutar programmet. Hej då!');
        exit(0);
      default:
        print('Ogiltigt val. Försök igen.');
    }
  }
}