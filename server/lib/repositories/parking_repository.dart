import '../models/parking.dart';
import '../objectbox.g.dart';

class ParkingRepository {
  final Box<Parking> _parkingBox;

  ParkingRepository(this._parkingBox);

  List<Parking> getAll() => _parkingBox.getAll();

  Parking? getById(int id) => _parkingBox.get(id);

  void add(Parking parking) => _parkingBox.put(parking);

  void update(Parking parking) => _parkingBox.put(parking);

  void delete(int id) => _parkingBox.remove(id);
}
