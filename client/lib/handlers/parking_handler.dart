import 'dart:io';
import 'package:client/models/parking.dart';
import 'package:client/repositories/parking_repository.dart';
import 'package:client/repositories/vehicle_repository.dart';
import 'package:client/repositories/parking_space_repository.dart';

Future<void> manageParkings(ParkingRepository parkingRepo, VehicleRepository vehicleRepo, ParkingSpaceRepository spaceRepo) async {
  while (true) {
    print('\nHantera Parkeringar');
    print('1. Skapa ny parkering');
    print('2. Visa alla parkeringar');
    print('3. Uppdatera parkering');
    print('4. Ta bort parkering');
    print('5. Tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await createParking(parkingRepo, vehicleRepo, spaceRepo);
        break;
      case '2':
        await listParkings(parkingRepo);
        break;
      case '3':
        await updateParking(parkingRepo);
        break;
      case '4':
        await deleteParking(parkingRepo);
        break;
      case '5':
        return;
      default:
        print('Ogiltigt val. Försök igen.');
    }
  }
}

Future<void> createParking(ParkingRepository parkingRepo, VehicleRepository vehicleRepo, ParkingSpaceRepository spaceRepo) async {
  stdout.write('Ange fordonets registreringsnummer: ');
  final registrationNumber = stdin.readLineSync();
  stdout.write('Ange parkeringsplatsens ID: ');
  final spaceIdInput = stdin.readLineSync();
  final spaceId = int.tryParse(spaceIdInput ?? '');

  if (registrationNumber != null && spaceId != null) {
    final vehicle = await vehicleRepo.getByRegistrationNumber(registrationNumber);
    final space = await spaceRepo.getById(spaceId.toString());

    if (vehicle == null || space == null) {
      print('Fordon eller parkeringsplats inte hittad.');
      return;
    }

    final parking = Parking(id: 0, vehicleId: vehicle.id, parkingSpaceId: space.id, startTime: DateTime.now());
    await parkingRepo.add(parking);
    print('Parkering tillagd: $parking');
  } else {
    print('Ogiltig inmatning.');
  }
}

Future<void> listParkings(ParkingRepository parkingRepo) async {
  final parkings = await parkingRepo.getAll();
  if (parkings.isEmpty) {
    print('Inga parkeringar registrerade.');
  } else {
    parkings.forEach(print);
  }
}

Future<void> updateParking(ParkingRepository parkingRepo) async {
  stdout.write('Ange parkering ID för att uppdatera: ');
  final idInput = stdin.readLineSync();
  final parkingId = int.tryParse(idInput ?? '');

  if (parkingId == null) {
    print('Ogiltigt ID.');
    return;
  }

  final parking = await parkingRepo.getById(parkingId);
  if (parking == null) {
    print('Parkering inte hittad.');
    return;
  }

  stdout.write('Ange ny sluttid (YYYY-MM-DD HH:MM), lämna tomt för ingen ändring: ');
  final endTimeInput = stdin.readLineSync();
  if (endTimeInput != null && endTimeInput.isNotEmpty) {
    try {
      parking.endTime = DateTime.parse(endTimeInput.replaceFirst(' ', 'T'));
      await parkingRepo.update(parking);
      print('Parkering uppdaterad: $parking');
    } catch (e) {
      print('Ogiltigt datumformat.');
    }
  } else {
    print('Inga ändringar gjorda.');
  }
}

Future<void> deleteParking(ParkingRepository parkingRepo) async {
  stdout.write('Ange parkering ID för att ta bort: ');
  final idInput = stdin.readLineSync();
  final parkingId = int.tryParse(idInput ?? '');

  if (parkingId != null) {
    await parkingRepo.delete(parkingId);
    print('Parkering borttagen.');
  } else {
    print('Ogiltig inmatning.');
  }
}
