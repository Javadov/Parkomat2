import '../models/parking_space.dart';
import '../objectbox.g.dart';

class ParkingSpaceRepository {
  final Box<ParkingSpace> _parkingSpaceBox;

  ParkingSpaceRepository(this._parkingSpaceBox);

  Future<List<ParkingSpace>> getAll() async {
    return _parkingSpaceBox.getAll();
  }

  Future<ParkingSpace?> getById(int id) async {
    return _parkingSpaceBox.get(id);
  }

  Future<void> add(ParkingSpace parkingSpace) async {
    _parkingSpaceBox.put(parkingSpace);
  }

  Future<void> update(ParkingSpace parkingSpace) async {
    _parkingSpaceBox.put(parkingSpace);
  }

  Future<void> delete(int id) async {
    _parkingSpaceBox.remove(id);
  }
}