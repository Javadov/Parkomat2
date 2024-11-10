import 'dart:io';
import 'package:client/models/parking_space.dart';
import 'package:client/repositories/parking_space_repository.dart';

Future<void> manageParkingSpaces(ParkingSpaceRepository repo) async {
  while (true) {
    print('\nHantera Parkeringsplatser');
    print('1. Skapa ny parkeringsplats');
    print('2. Visa alla parkeringsplatser');
    print('3. Uppdatera parkeringsplats');
    print('4. Ta bort parkeringsplats');
    print('5. Tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await createParkingSpace(repo);
        break;
      case '2':
        await listParkingSpaces(repo);
        break;
      case '3':
        await updateParkingSpace(repo);
        break;
      case '4':
        await deleteParkingSpace(repo);
        break;
      case '5':
        return;
      default:
        print('Ogiltigt val. Försök igen.');
    }
  }
}

Future<void> createParkingSpace(ParkingSpaceRepository repo) async {
  stdout.write('Ange adress: ');
  final address = stdin.readLineSync();
  stdout.write('Ange pris per timme: ');
  final priceInput = stdin.readLineSync();
  final pricePerHour = double.tryParse(priceInput ?? '');

  if (address != null && pricePerHour != null) {
    final space = ParkingSpace(id: 0, address: address, pricePerHour: pricePerHour);
    await repo.add(space);
    print('Parkeringsplats tillagd: $space');
  } else {
    print('Ogiltig inmatning.');
  }
}

Future<void> listParkingSpaces(ParkingSpaceRepository repo) async {
  final spaces = await repo.getAll();
  if (spaces.isEmpty) {
    print('Inga parkeringsplatser registrerade.');
  } else {
    spaces.forEach(print);
  }
}

Future<void> updateParkingSpace(ParkingSpaceRepository repo) async {
  stdout.write('Ange parkeringsplats ID för att uppdatera: ');
  final id = stdin.readLineSync();
  if (id == null || id.isEmpty) {
    print('Ogiltigt ID.');
    return;
  }

  final space = await repo.getById(id);
  if (space == null) {
    print('Parkeringsplats inte hittad.');
    return;
  }

  stdout.write('Ange ny adress (nuvarande: ${space.address}): ');
  final newAddress = stdin.readLineSync();
  stdout.write('Ange nytt pris per timme (nuvarande: ${space.pricePerHour}): ');
  final newPriceInput = stdin.readLineSync();
  final newPrice = double.tryParse(newPriceInput ?? '');

  if (newAddress != null && newPrice != null) {
    space.address = newAddress;
    space.pricePerHour = newPrice;
    await repo.update(space);
    print('Parkeringsplats uppdaterad: $space');
  } else {
    print('Ogiltig inmatning.');
  }
}

Future<void> deleteParkingSpace(ParkingSpaceRepository repo) async {
  stdout.write('Ange parkeringsplats ID för att ta bort: ');
  final id = stdin.readLineSync();
  if (id != null && id.isNotEmpty) {
    await repo.delete(id);
    print('Parkeringsplats borttagen.');
  } else {
    print('Ogiltig inmatning.');
  }
}
