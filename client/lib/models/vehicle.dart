import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle {
  int id;
  String registrationNumber;
  String type;
  int ownerId;

  Vehicle({required this.id, required this.registrationNumber, required this.type, required this.ownerId});

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  @override
  String toString() => 'ID: $id, Reg. Number: $registrationNumber, Type: $type, Owner ID: $ownerId';
}