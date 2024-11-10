import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
@Entity()
class Vehicle {
  @Id(assignable: true)
  int id;
  String registrationNumber;
  String type;
  int ownerId;

  Vehicle({this.id = 0, required this.registrationNumber, required this.type, required this.ownerId});

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
