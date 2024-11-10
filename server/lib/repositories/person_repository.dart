import '../models/person.dart';
import '../objectbox.g.dart';

class PersonRepository {
  final Box<Person> _personBox;

  PersonRepository(this._personBox);

  Future<List<Person>> getAll() async {
    return _personBox.getAll();
  }

  Future<Person?> getByPersonalNumber(String personalNumber) async {
    return _personBox.query(Person_.personalNumber.equals(personalNumber)).build().findFirst();
  }

  Future<void> add(Person person) async {
    _personBox.put(person);
  }

  Future<void> update(Person person) async {
    _personBox.put(person);
  }

  Future<void> delete(int id) async {
    _personBox.remove(id);
  }
}