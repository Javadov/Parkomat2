import '../models/parking_space.dart';
import '../objectbox.g.dart';

class ParkingSpaceRepository {
  final Box<ParkingSpace> _parkingSpaceBox;

  ParkingSpaceRepository(this._parkingSpaceBox);

  List<ParkingSpace> getAll() => _parkingSpaceBox.getAll();

  ParkingSpace? getById(int id) => _parkingSpaceBox.get(id);

  void add(ParkingSpace parkingSpace) => _parkingSpaceBox.put(parkingSpace);

  void update(ParkingSpace parkingSpace) => _parkingSpaceBox.put(parkingSpace);

  void delete(int id) => _parkingSpaceBox.remove(id);
}
