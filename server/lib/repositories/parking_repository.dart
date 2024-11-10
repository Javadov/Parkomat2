import '../models/parking.dart';
import '../objectbox.g.dart';

class ParkingRepository {
  final Box<Parking> _parkingBox;

  ParkingRepository(this._parkingBox);

  Future<List<Parking>> getAll() async {
    return _parkingBox.getAll();
  }

  Future<Parking?> getById(int id) async {
    return _parkingBox.get(id);
  }

  Future<void> add(Parking parking) async {
    _parkingBox.put(parking);
  }

  Future<void> update(Parking parking) async {
    _parkingBox.put(parking);
  }

  Future<void> delete(int id) async {
    _parkingBox.remove(id);
  }
}