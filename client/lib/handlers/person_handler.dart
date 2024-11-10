import 'dart:io';
import 'package:client/models/person.dart';
import 'package:client/repositories/person_repository.dart';

Future<void> managePersons(PersonRepository repo) async {
  while (true) {
    print('\nHantera Personer');
    print('1. Skapa ny person');
    print('2. Visa alla personer');
    print('3. Uppdatera person');
    print('4. Ta bort person');
    print('5. Tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await createPerson(repo);
        break;
      case '2':
        await listPersons(repo);
        break;
      case '3':
        await updatePerson(repo);
        break;
      case '4':
        await deletePerson(repo);
        break;
      case '5':
        return;
      default:
        print('Ogiltigt val. Försök igen.');
    }
  }
}

Future<void> createPerson(PersonRepository repo) async {
  stdout.write('Ange namn: ');
  final name = stdin.readLineSync();
  stdout.write('Ange personnummer: ');
  final personalNumber = stdin.readLineSync();

  print('Person test1: $name - $personalNumber');

  if (name != null && personalNumber != null) {
    final person = Person(id: 0, name: name, personalNumber: personalNumber);
    print('Person test2: $person');
    await repo.add(person);
    print('Person tillagd: $person');
  } else {
    print('Ogiltig inmatning.');
  }
}

Future<void> listPersons(PersonRepository repo) async {
  final persons = await repo.getAll();
  if (persons.isEmpty) {
    print('Inga personer registrerade.');
  } else {
    persons.forEach(print);
  }
}

Future<void> updatePerson(PersonRepository repo) async {
  stdout.write('Ange personnummer för att uppdatera: ');
  final personalNumber = stdin.readLineSync();
  if (personalNumber == null || personalNumber.isEmpty) {
    print('Ogiltigt personnummer.');
    return;
  }

  final person = await repo.getByPersonalNumber(personalNumber);
  if (person == null) {
    print('Person inte hittad.');
    return;
  }

  stdout.write('Ange nytt namn (nuvarande: ${person.name}): ');
  final newName = stdin.readLineSync();
  if (newName != null && newName.isNotEmpty) {
    person.name = newName;
    await repo.update(person);
    print('Person uppdaterad: $person');
  } else {
    print('Ogiltig inmatning.');
  }
}

Future<void> deletePerson(PersonRepository repo) async {
  stdout.write('Ange personnummer för att ta bort: ');
  final personalNumber = stdin.readLineSync();
  if (personalNumber != null && personalNumber.isNotEmpty) {
    await repo.delete(personalNumber);
    print('Person borttagen.');
  } else {
    print('Ogiltig inmatning.');
  }
}