import '../models/person.dart';
import '../objectbox.g.dart';

class PersonRepository {
  final Box<Person> _personBox;

  PersonRepository(this._personBox);

  List<Person> getAll() => _personBox.getAll();

  Person? getByPersonalNumber(String personalNumber) {
    return _personBox.query(Person_.personalNumber.equals(personalNumber)).build().findFirst();
  }

  void add(Person person) => _personBox.put(person);

  void update(Person person) => _personBox.put(person);

  void delete(int id) => _personBox.remove(id);
}