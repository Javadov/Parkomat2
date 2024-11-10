import '../models/vehicle.dart';
import '../objectbox.g.dart';

class VehicleRepository {
  final Box<Vehicle> _vehicleBox;

  VehicleRepository(this._vehicleBox);

  List<Vehicle> getAll() => _vehicleBox.getAll();

  Vehicle? getByRegistrationNumber(String registrationNumber) {
    return _vehicleBox.query(Vehicle_.registrationNumber.equals(registrationNumber)).build().findFirst();
  }

  void add(Vehicle vehicle) => _vehicleBox.put(vehicle);

  void update(Vehicle vehicle) => _vehicleBox.put(vehicle);

  void delete(int id) => _vehicleBox.remove(id);
}
