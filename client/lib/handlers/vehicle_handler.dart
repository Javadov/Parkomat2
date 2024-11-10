import 'dart:io';
import 'package:client/models/vehicle.dart';
//import 'package:client/models/person.dart';
import 'package:client/repositories/vehicle_repository.dart';
import 'package:client/repositories/person_repository.dart';

Future<void> manageVehicles(VehicleRepository vehicleRepo, PersonRepository personRepo) async {
  while (true) {
    print('\nHantera Fordon');
    print('1. Skapa nytt fordon');
    print('2. Visa alla fordon');
    print('3. Uppdatera fordon');
    print('4. Ta bort fordon');
    print('5. Tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await createVehicle(vehicleRepo, personRepo);
        break;
      case '2':
        await listVehicles(vehicleRepo);
        break;
      case '3':
        await updateVehicle(vehicleRepo, personRepo);
        break;
      case '4':
        await deleteVehicle(vehicleRepo);
        break;
      case '5':
        return;
      default:
        print('Ogiltigt val. Försök igen.');
    }
  }
}

Future<void> createVehicle(VehicleRepository vehicleRepo, PersonRepository personRepo) async {
  stdout.write('Ange registreringsnummer: ');
  final registrationNumber = stdin.readLineSync();
  stdout.write('Ange typ av fordon (t.ex. bil, motorcykel): ');
  final type = stdin.readLineSync();
  stdout.write('Ange ägarens personnummer: ');
  final ownerPersonalNumber = stdin.readLineSync();

  if (registrationNumber != null && type != null && ownerPersonalNumber != null) {
    final owner = await personRepo.getByPersonalNumber(ownerPersonalNumber);
    if (owner == null) {
      print('Ägare inte hittad. Lägg till ägaren först.');
      return;
    }

    final vehicle = Vehicle(id: 0, registrationNumber: registrationNumber, type: type, ownerId: owner.id);
    await vehicleRepo.add(vehicle);
    print('Fordon tillagt: $vehicle');
  } else {
    print('Ogiltig inmatning.');
  }
}

Future<void> listVehicles(VehicleRepository vehicleRepo) async {
  final vehicles = await vehicleRepo.getAll();
  if (vehicles.isEmpty) {
    print('Inga fordon registrerade.');
  } else {
    vehicles.forEach(print);
  }
}

Future<void> updateVehicle(VehicleRepository vehicleRepo, PersonRepository personRepo) async {
  stdout.write('Ange registreringsnummer för att uppdatera: ');
  final registrationNumber = stdin.readLineSync();
  if (registrationNumber == null || registrationNumber.isEmpty) {
    print('Ogiltigt registreringsnummer.');
    return;
  }

  final vehicle = await vehicleRepo.getByRegistrationNumber(registrationNumber);
  if (vehicle == null) {
    print('Fordon inte hittat.');
    return;
  }

  stdout.write('Ange ny typ av fordon (nuvarande: ${vehicle.type}): ');
  final newType = stdin.readLineSync();
  if (newType != null && newType.isNotEmpty) {
    vehicle.type = newType;
    await vehicleRepo.update(vehicle);
    print('Fordon uppdaterat: $vehicle');
  } else {
    print('Ogiltig inmatning.');
  }
}

Future<void> deleteVehicle(VehicleRepository vehicleRepo) async {
  stdout.write('Ange registreringsnummer för att ta bort: ');
  final registrationNumber = stdin.readLineSync();
  if (registrationNumber != null && registrationNumber.isNotEmpty) {
    await vehicleRepo.delete(registrationNumber);
    print('Fordon borttaget.');
  } else {
    print('Ogiltig inmatning.');
  }
}