import '../models/vehicle.dart';
import '../objectbox.g.dart';

class VehicleRepository {
  final Box<Vehicle> _vehicleBox;

  VehicleRepository(this._vehicleBox);

  Future<List<Vehicle>> getAll() async {
    return _vehicleBox.getAll();
  }

  Future<Vehicle?> getByRegistrationNumber(String registrationNumber) async {
    return _vehicleBox.query(Vehicle_.registrationNumber.equals(registrationNumber)).build().findFirst();
  }

  Future<void> add(Vehicle vehicle) async {
    _vehicleBox.put(vehicle);
  }

  Future<void> update(Vehicle vehicle) async {
    _vehicleBox.put(vehicle);
  }

  Future<void> delete(int id) async {
    _vehicleBox.remove(id);
  }
}